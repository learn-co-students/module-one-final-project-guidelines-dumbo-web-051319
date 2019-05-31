class Welcome
  def self.welcome_to_igl
    Utility.clear_page
    Utility.artii_meun_title("Welcome to Instagram Lite")
    choice = $prompt.select("", ["Sign up", "Log in", "Exit"])
    Utility.clear_page
    if choice == "Sign up"
      Authentication.sign_up
      Authentication.login
    elsif choice == "Log in"
      Authentication.login
    elsif choice == "Exit"
      Utility.clear_page
      Utility.artii_meun_title("Goodbye !!! See ya")
      exit
    end
  end
end
