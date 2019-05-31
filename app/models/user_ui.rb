class UserUI
  def self.master(user)
    Utility.artii_meun_title("Main Menu")
    choice = $prompt.select("User ID:#{user.id} | #{user.name}", ["Account Setting", "Create Posts", "My Post", "All Posts", "Logout"])
    Utility.clear_page
    if choice == "Create Posts"
     self.create_post(user)
    elsif choice == 'My Post'
     self.my_post(user)
    elsif choice == 'All Posts'
     self.all_posts(user)
    elsif choice == "Account Setting"
      AccountProfile.account_menu(user)
    else
     Welcome.welcome_to_igl
    end
  end

  def self.create_post(user)
    Utility.create_post(user)
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
