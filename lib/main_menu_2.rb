def ruby_clear
  system "clear" or system "cls"
end

def splash
  puts "                         ____   ___   ____     "
  puts "                        |  _ \\ ( _ ) |  _ \\  "
  puts "                        | | | |/ _ \\/\\ | | | "
  puts "                        | |_| | (_>  < |_| |   "
  puts "                        |____/ \\___/\\/____/  "
  puts "            ____ _                          _                "
  puts "           / ___| |__   __ _ _ __ __ _  ___| |_ ___ _ __     "
  puts "          | |   | '_ \\ / _` | '__/ _` |/ __| __/ _ \\ '__|  "
  puts "          | |___| | | | (_| | | | (_| | (__| ||  __/ |       "
  puts "           \\____|_| |_|\\__,_|_|  \\__,_|\\___|\\__\\___|_| "
  puts "                 _____                _                      "
  puts "                / ___|_ __ ___   __ _| |_ __  _ __           "
  puts "               | |   | '__/ _ \\/ _` | __/ _ \\| '__|        "
  puts "               | |___| | |  __/ (_| | || (_) | |             "
  puts "                \\____|_|  \\___|\\__,_|\\__\\___/|_|        "
  puts ""
end

def ascii_wizard
  puts "         /^\\
    /\\   'V'
   /__\\   I
  //..\\\\  I
  \\].`[/  I
  /l\\/j\\  (]
 /. ~~ ,\\/I
 \\\\L__j^\\/I
  \\/--v}  I
  |    |  I
  |    |  I
  |    l  I
_/j  L l\\_!"
end

def ascii_knight
  puts "       !
      .-.
    __|=|__
   (_/`-`\\_)
   //\\___/\\\\
   <>/   \\<>
    \\|_._|/
     <_I_>
      |||
     /_|_\\"
end

def get_pause
  prompt = TTY::Prompt.new
  prompt.ask("")
  ruby_clear
end

def spinner
  ruby_clear
  spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :shark)
  spinner.auto_spin # Automatic animation with default interval
  sleep(2.5) # Perform task
  spinner.stop('Done!') # Stop animation
  ruby_clear
end

def main_menu_list_input_prompt
  main_menu_prompt = TTY::Prompt.new
  main_input = main_menu_prompt.select("Select Option", ["List Characters", "List Spells", "Create Character", "Edit Character", "Delete Character", "Exit"])
  puts 7.chr
  main_input
end

def main_menu_input_selector(input, user)
  # binding.pry
  case input
  when "List Characters"
     if user.characters.length > 0
       user.print_characters
     else
       puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
       puts "User has no characters."
       puts ""
     end
     get_pause

   when "List Spells"
     if user.characters.length > 0
       user.print_spells
     else
       puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
       puts "User has no characters."
       puts ""
     end
     get_pause
  when "Create Character"
    puts "Creating Character"
    create_character_prompt(user)

  when "Edit Character"
    puts "Editing Character"
    user.edit_characters(user)
    # get_pause

  when "Delete Character"
    user.print_characters
    delete_prompt = TTY::Prompt.new
    prompt_array = user.characters.map {|character| character.name}
    delete_name = delete_prompt.select("Select Character to delete.", prompt_array)
    delete_index = prompt_array.find_index(delete_name)
    character_x = user.characters[(delete_index.to_i)]
    character_x.destroy
    ruby_clear
  when "Exit"
    puts "Exiting"
    ruby_clear
  end
  user
end

def main_menu_loop(user)
  main_input = ""
  while main_input != "Exit"
    splash
    main_input = main_menu_list_input_prompt
    main_menu_input_selector(main_input, user)
    user = user.refreshing
  end
end
