require_relative '../config/environment'

spinner
user = list_input_prompt
main_menu_loop(user)
puts "Goodbye"
