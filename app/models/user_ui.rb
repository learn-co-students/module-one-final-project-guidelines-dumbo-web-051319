class UserUI
  def self.master(user)
     choice = $prompt.select("Welcome!!", %w(Create_Posts My_Post All_Post Exit))
     if choice == "Create_Posts"
       self.create_post(user)
     elsif choice == 'My_Post'
       self.my_post(user)
     elsif choice == 'ALl_Post'
       puts "all posts"
     else
       puts "See ya~~~"
     end
  end

  def self.create_post(user)
    content = $prompt.ask('What do you want to post?', default: ENV['CONTENT'])
    Utility.pick_picture(user, content)
  end

  def self.my_post(user)
    posts = AllPosts.arry_of_posts(user)
    Utility.show_posts(posts, user)
  #   posts = Post.where(account_id: user.id)
  #   posts.each do |post|
  #     puts post.content
  #   end
  end
end
