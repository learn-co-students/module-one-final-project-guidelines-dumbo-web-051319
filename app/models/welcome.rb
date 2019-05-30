class Welcome
  def self.welcome_to_igl
    choice = $prompt.select("Welcome to Instagram Lite in CLI", %w(Sign_up Log_in Exit))

    if choice == "Sign_up"
      Utility.sign_up
      Utility.login
    elsif choice == "Log_in"
      Utility.login
    else
      puts "See ya~~~~"
    end
  end
end
