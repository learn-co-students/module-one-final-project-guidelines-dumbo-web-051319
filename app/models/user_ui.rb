class UserUI
  def self.master(user)
     choice = $prompt.select("Options:", %w(Create_Posts My_Post All_Posts Logout))
     if choice == "Create_Posts"
       self.create_post(user)
     elsif choice == 'My_Post'
       self.my_post(user)
     elsif choice == 'All_Posts'
       self.all_posts(user)
     else
       Welcome.welcome_to_igl
     end
  end

  def self.create_post(user)
    content = $prompt.ask('What do you want to post?', default: ENV['CONTENT'])
    Utility.pick_picture(user, content)
  end

  def self.my_post(user)
    users = []
    users << user
    Utility.show_posts(user, users)
  end

  def self.all_posts(user)
    users = []
    users = Account.all
    Utility.show_posts(user, users)
  end
end
