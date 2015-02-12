class RawPage
  attr_reader :raw_data

  def initialize(url)
    begin
      @raw_data = Nokogiri::HTML(open(url))
    rescue Exception
      Interface.unable_to_load(url)
      exit
    end
  end
end

class PageParser
  def self.hacker_news(url)
    page = RawPage.new(url)
    title = page.raw_data.css('td.title a').text
    url = page.raw_data.css('td.title a').map { |link| link['href'] }
    url = url[0]
    points = page.raw_data.css('.score').text
    item_id = page.raw_data.css('.score')[0]['id'][6..-1]
    post = Post.new(title, url, points, item_id)
    comments = page.raw_data.css('td .default')

    comments.each do |comment|
      comhead = comment.css('.comhead').text.split(' ')
      poster = comhead[0]
      age = comhead[1] + ' ' + comhead[2]
      comment_text = comment.css('.comment').text
      new_comment = Comment.new(poster, age, comment_text)
      post.add_comment(new_comment)
    end
    post
  end
end

class Post
  attr_reader :title, :url, :points, :item_id, :comments

  def initialize(title = '', url = '', points = '', item_id = '')
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def add_comment(comment)
    @comments << comment
  end
end

class Comment
  attr_reader :poster, :age, :comment_text

  def initialize(poster, age, comment_text)
    @poster = poster
    @age = age
    @comment_text = comment_text
  end
end




