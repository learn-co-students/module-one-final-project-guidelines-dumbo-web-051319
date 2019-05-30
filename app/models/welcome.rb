class Welcome
  def self.welcome_to_igl
    choice = $prompt.select("Welcome to Instagram Lite", %w(Sign_up Log_in Exit))

    if choice == "Sign_up"
      Utility.sign_up
      Utility.login
    elsif choice == "Log_in"
      Utility.login
    elsif choice == "Exit"
      puts "See ya~~~~"
      exit
    end
  end
end
