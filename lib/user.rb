class User < ActiveRecord::Base
  has_many :user_characters
  has_many :characters, through: :user_characters

  def print_characters
    pastel = Pastel.new
    puts "Characters List "
    self.characters.each_with_index do |character, index|
      puts ""
      ascii_knight
      puts ""
      puts "∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆"
      puts ""
      puts ""
      puts pastel.yellow("  ¬ Name: #{character.name}")
      puts pastel.yellow("  ¬ Race: #{character.race}")
      puts pastel.yellow("  ¬ Class: #{character.class_name}")
      puts ""
      puts ""
      puts "∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆"
    end
  end

  def print_spells
    pastel = Pastel.new
    puts "Character Spell List"
    self.characters.each_with_index do |character, c_index|
      puts "∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆∞∞∞∞∆∆∆∆"
      puts ""
      puts pastel.yellow("  ¬ Name: #{character.name}")
      puts pastel.yellow("  ¬ Race: #{character.race}")
      puts pastel.yellow("  ¬ Class: #{character.class_name}")
      character.spells.each_with_index do |spell, s_index|
        puts ""
        puts pastel.blue("      ¬ Spell: #{s_index+1}")
        puts pastel.blue("      ¬ Spell name: #{spell.name}")
        puts pastel.blue("      ¬ Spell description: #{spell.description}")
        puts ""
        puts ""
      end
    end
  end


  def edit_characters(user)
    puts "Editing Character"
    # user.edit_characters(user)
    user.print_characters
    edit_prompt = TTY::Prompt.new
    prompt_array = user.characters.map {|character| character.name}
    edit_name = edit_prompt.select("Select Character to edit.", prompt_array)
    edit_index = prompt_array.find_index(edit_name)
    character_x = user.characters[(edit_index.to_i)]
    attr_prompt = TTY::Prompt.new
    attr_select = attr_prompt.select("Select attribute to edit.", ["Name", "Race", "Class", "Spells"])
    if attr_select == "Spells"
      spell_array = Spell.all.map do |spell|
        spell.name
      end
      spell_prompt = TTY::Prompt.new
      spell_select = spell_prompt.select("Select spell to add to character.", spell_array)
      character_x.spells << Spell.all.find_by(name: spell_select)
      character_x.save
    else
      attr_select = attr_select.downcase
      prompt = TTY::Prompt.new
      new_input = prompt.ask("Enter new #{attr_select}")
      character_x[attr_select] = new_input
      character_x.save
    end
    ruby_clear
    # user.print_characters
    # edit_prompt = TTY::Prompt.new
    # prompt_array = user.characters.map {|character| character.name}
    # edit_name = edit_prompt.select("Select Character to edit.", prompt_array)
    # edit_index = prompt_array.find_index(edit_name)
    # character_x = user.characters[(edit_index.to_i)]
    # new_name = edit_prompt.ask("What would you like to change name to??")
    # character_x.name= "#{new_name}"
    # get_pause
    # puts "Congratulations!! You successfully changed your characters name to #{new_name}!! Isn't that exciting?!?!..."
    # puts "."
    # sleep(1)
    # puts ".."
    # sleep(2)
    # puts "..."
    # character_x.save
    # ruby_clear
  end

  # user.print_characters
  # edit_prompt = TTY::Prompt.new
  # prompt_array = user.characters.map {|character| character.name}
  # edit_name = edit_prompt.select("Select Character to edit.", prompt_array)
  # delete_index = prompt_array.find_index(edit_name)
  # character_x = user.characters[(delete_index.to_i)]
  # character_x.destroy

  def refreshing
    User.find_by(id: self.id)
  end
end
