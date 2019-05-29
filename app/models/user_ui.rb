class UserUI
  def self.master(user)
     choice = $prompt.select("Welcome!!", %w(Create_Posts My_Post All_Post))
     if choice == "Create_Posts"
       self.create_post(user)
     elsif choice == 'My_Post'
       self.my_post(user)
     elsif choice == 'ALl_Post'

     end
  end

  def self.create_post(user)
    content = $prompt.ask('What do you want to post?', default: ENV['CONTENT'])
    path = Utility.pick_picture
    Post.create(account_id: user.id, content: content, picture_path: path)
  end

  def self.my_post(user)
    posts = Post.where(account_id: user.id)
    posts.each do |post|
      puts post.content
    end
  end
end
