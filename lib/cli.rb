require 'pry'
class CommandLineInterface

def signing_options
    prompt = TTY::Prompt.new
    choice = prompt.select("Welcome to RoofHopper", %w(LogIn SignUp))
    
end



end
