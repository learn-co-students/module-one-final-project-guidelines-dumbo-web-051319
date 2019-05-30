class UserUI
  def self.master(user)
     choice = $prompt.select("Options:", %w(Create_Posts My_Post All_Post Logout))
     if choice == "Create_Posts"
       self.create_post(user)
     elsif choice == 'My_Post'
       self.my_post(user)
     elsif choice == 'ALl_Post'
       puts "all posts"
     else
       Welcome.welcome_to_igl
     end
  end

  def self.create_post(user)
    content = $prompt.ask('What do you want to post?', default: ENV['CONTENT'])
    Utility.pick_picture(user, content)
  end

  def self.my_post(user)
    posts = AllPosts.arry_of_posts(user)
    Utility.show_posts(posts, user)
  end
end
