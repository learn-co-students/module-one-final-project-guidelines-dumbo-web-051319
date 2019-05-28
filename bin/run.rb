require_relative '../config/environment'

$prompt = TTY::Prompt.new

choice = $prompt.select("Welcome!!", %w(Sign_up Log_in))

if choice == "Sign_up"
  Utility.sign_up
  Utility.login
elsif choice == "Log_in"
  Utility.login
end
