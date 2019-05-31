class Authentication
  #Sign Up
  def self.sign_up
    Utility.artii_meun_title("Sign UP")
    name = $prompt.ask('What is your name? ')
    password = $prompt.mask("Create password:")
    repeat_password = $prompt.mask("Repeat Password: ")
    if double_chack_passowrd(password, repeat_password)
      src_dir = Utility.pick_picture
      address = $prompt.ask('What is your address? ')
      bio = $prompt.ask('Something about yourself. ')
      Account.create(name: name, password: password, address: address, bio: bio, profile_picture_path: $dst_dir + "/#{File.basename(src_dir)}")
      new_account = Account.where("name == ?", name)[-1]
      Utility.clear_page
      puts "Here is you Account ID #{new_account.id}"
    else
      choice = $prompt.select("One or more information is wrong, please try again.", ["Try Again", "Cancel"])
      if choice == "Try Again"
        Utility.clear_page
        sign_up
      elsif choice == "Cancel"
        Utility.clear_page
        Welcome.welcome_to_igl
      end
    end
  end
  #Login
  def self.login
    Utility.artii_meun_title("Login")
    account_id = $prompt.ask('Account ID:', default: ENV['ACCOUNT_ID'])
    password = $prompt.mask("Password:")
    Utility.clear_page
    user = Account.find_by(id: account_id)
    if user == nil || user.password != password
      puts "Wrong Account ID or Password, please try again"
      login
    elsif user.password == password
      welcome_back = Artii::Base.new :font => "slant"
      puts welcome_back.asciify("Welcome back")
      UserUI.master(user)
    end
  end
  def self.double_chack_passowrd(password, password2)
    bol = false
    if password == password2
      bol = true
    end
    bol
  end
  def self.check_current_password(user, password)
    bol = false
    if password == user.password
      bol = true
    end
    bol
  end
  def self.check_account(user, post)
    bol = false
    post_id = post.split(" ")[1].to_i
    post_author_id = Post.find_by(id: post_id).account_id
    if user.id == post_author_id
      bol = true
    end
    bol
  end
  def self.give_options(user, post)
    option_arry = ["Like", "Comment", "Back", "Back to Main Menu", "Logout"]
    if check_account(user, post) == true
      option_arry = ["Like", "Comment", "Edit", "Delete", "Back", "Back to Main Menu", "Logout"]
    end
    option_arry
  end
end
