class Interface

  def self.display_help
    puts "First argument must be the type of page you are scraping from.".red
    puts "'hn' for Hacker News, 'rd' for Reddit".red
    puts "Second argument must be the url.".red
  end

  def self.invalid_arguments
    puts "Invalid Arguments!".red
  end

  def self.unable_to_load(url)
    puts "#{url}".red
    puts "Unable to load URL! Check your spelling!".red
  end

  def self.command(arg1, arg2)
    case arg1
    when 'help'
      self.display_help
    end
  end

  def self.display_post(post)
    display_comments(post)
    puts "From page: " + "#{ARGV[1]}".red
    puts "Title:     " + post.title.blue
    puts "Url:       " + post.url.blue
    puts "Score:     " + post.points.blue
    puts "ID:        " + post.item_id.blue
  end

  def self.display_comments(post)
    post.comments.each do |comment|
      puts 'Comment by ' + comment.poster.blue + ', Posted ' + comment.age + ' ago.'
      puts comment.comment_text.green
      puts ''
    end
  end
end