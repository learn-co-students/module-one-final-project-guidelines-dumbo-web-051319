def character_create_splash
  puts ""
  puts "********************************"
  puts "****   Creating Character   ****"
  puts "********************************"
  sleep(1)
  # character_name_prompt
end

def character_name_prompt
  ruby_clear
  puts "********************************"
  puts "***  Enter Character's name  ***"
  puts "********************************"
  puts ""

  prompt = TTY::Prompt.new
  user_name = prompt.ask('Type character name:')
  puts 7.chr
  user_name
end

def character_race_prompt

  ruby_clear
  character_array = ["Dragonborn", "Dwarf", "Elf", "Gnome", "Half-Elf", "Halfling", "Half-Orc", "Human", "Tiefling"]
  prompt = TTY::Prompt.new
  race = prompt.select("Select character race", character_array)
  puts 7.chr
  race

end

def character_class_prompt

    ruby_clear
    class_array = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
    prompt = TTY::Prompt.new
    class_name = prompt.select("Select character class", class_array)
    puts 7.chr
    class_name
end

def character_save(user)
  ruby_clear
  puts ""
  puts "********************************"
  puts "****    Saving Character    ****"
  puts "********************************"
  puts ""
  sleep 0.6
  puts ".".center(32)
  sleep 0.6
  puts ".".center(32)
  sleep 0.6
  puts ".".center(32)
  sleep 0.6
  puts ".".center(32)
  ascii_wizard
  font = TTY::Font.new(:standard)
  prompt = TTY::Prompt.new
  pastel = Pastel.new
  puts pastel.green(font.write("CONGRATULATIONS!!"))
  get_pause

  ruby_clear
  user.refreshing
end

def create_character_prompt(user)
  character_create_splash
  c_name = character_name_prompt
  c_race = character_race_prompt
  c_class = character_class_prompt
  c = Character.create(name: c_name, race: c_race, class_name: c_class)
  u = UserCharacter.create(user_id: user.id, character_id: c.id)
  character_save(user)
end
