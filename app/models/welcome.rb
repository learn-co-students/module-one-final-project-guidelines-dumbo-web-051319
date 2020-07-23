class Welcome
  def self.welcome_to_igl
    Utility.clear_page
    welcome = Artii::Base.new :font => "slant"
    puts welcome.asciify("Welcome to Instagram Lite")
    choice = $prompt.select("", %w(Sign_up Log_in Exit))
    if choice == "Sign_up"
      Utility.sign_up
      Utility.login
    elsif choice == "Log_in"
      Utility.login
    elsif choice == "Exit"
      Utility.clear_page
      goodbye = Artii::Base.new :font => "slant"
      puts goodbye.asciify("Goodbye !!! See ya")
      exit
    end
  end
end
