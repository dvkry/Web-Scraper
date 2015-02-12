class Interface

  def self.display_help
    puts "First argument must be the type of page you are scraping from.".blue
    puts "'hn' for Hacker News, 'rd' for Reddit.".blue
    puts "Second argument must be the url.".blue
    puts ''
  end

  def self.invalid_arguments
    puts ''
    puts "Invalid Arguments!".red
  end

  def self.unable_to_load(url)
    puts ''
    puts "#{url}".red
    puts "Unable to load URL! Check your spelling!".red
    puts ''
    display_help
  end

  def self.no_read
    puts ''
    puts "URL does not appear to be formatted correctly.".red
    puts ''
    display_help
  end

  def self.command(arg1, arg2)
    case arg1
    when 'help'
      self.display_help
    end
  end

  def self.display_post(post)
    display_comments(post)
    puts "From page:      " + "#{ARGV[1]}".red
    puts "Title:          " + post.title.blue
    puts "Url:            " + post.url.blue
    puts "Score:          " + post.points.blue
    puts "ID:             " + post.item_id.blue
    puts "Total Comments: " + post.comments.length.to_s.blue
  end

  def self.display_comments(post)
    post.comments.each do |comment|
      puts 'Comment by ' + comment.poster.blue + ', Posted ' + comment.age + ' ago.'
      puts comment.comment_text.green
      puts ''
    end
  end
end
