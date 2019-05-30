class UserUI
  def self.master(user)
     choice = $prompt.select("Options:", %w(Create_Posts My_Post All_Posts Logout))
     Utility.clear_page
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
    if Post.where("account_id == ?", user.id).length == 0
      Utility.clear_page
      puts "You have no post yet, please create one."
      master(user)
    else
      Utility.show_posts(user, users)
    end
  end

  def self.all_posts(user)
    users = []
    users = Account.all
    if Post.all.length == 0
      Utility.clear_page
      puts "There are no posts, please create one."
      master(user)
    else
      Utility.show_posts(user, users)
    end
  end
end
