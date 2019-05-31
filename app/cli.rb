require_relative '../config/environment'


$user = nil
$digi_list = nil

def digital_world
system "clear"
`say "you are now entering the digitalworld"`
puts "
                                      /$$$$$$$  /$$           /$$   /$$               /$$             /$$      /$$                     /$$       /$$
                                      | $$__  $$|__/          |__/  | $$              | $$            | $$  /$ | $$                    | $$      | $$
                                      | $$  \ $$ /$$  /$$$$$$  /$$ /$$$$$$    /$$$$$$ | $$            | $$ /$$$| $$  /$$$$$$   /$$$$$$ | $$  /$$$$$$$
                                      | $$  | $$| $$ /$$__  $$| $$|_  $$_/   |____  $$| $$            | $$/$$ $$ $$ /$$__  $$ /$$__  $$| $$ /$$__  $$
                                      | $$  | $$| $$| $$  \ $$| $$  | $$      /$$$$$$$| $$            | $$$$_  $$$$| $$  \ $$| $$  \__/| $$| $$  | $$
                                      | $$  | $$| $$| $$  | $$| $$  | $$ /$$ /$$__  $$| $$            | $$$/ \  $$$| $$  | $$| $$      | $$| $$  | $$
                                      | $$$$$$$/| $$|  $$$$$$$| $$  |  $$$$/|  $$$$$$$| $$            | $$/   \  $$|  $$$$$$/| $$      | $$|  $$$$$$$
                                      |_______/ |__/ \____  $$|__/   \___/   \_______/|__/            |__/     \__/ \______/ |__/      |__/ \_______/
                                                     /$$  \ $$
                                                    |  $$$$$$/
                                                     \______/
  "
end

def music
  # system ("open digimon_music/Digimon-Full.mp3")
  pid = fork{ exec 'afplay', "digimon_music/Digimon-Full.mp3" }
end

def login_or_signup
    music
    prompt = TTY::Prompt.new
    input = prompt.yes?("You've just fallen into the Digiworld! Are you new here?")
    if input == true
      create_user
    else input == false
      get_user
    end
end

def create_user
  puts "yes of course you are, I can tell.."
  prompt = TTY::Prompt.new
  new_username = prompt.ask("so what do you want your username to be?", required: true) do |q|
    q.modify :chomp
  end
  $user = User.create(name: new_username)
  puts "\ncongratulations #{$user.name}, you've joined the Digicommunity"
  travel_or_edit
end

def get_user
  prompt = TTY::Prompt.new
  input = prompt.ask("welcome back. what was your name again?")
  if User.find_by(name: input)
    $user = User.find_by(name: input)
    puts "\nOh.. I'm surprised to see you back here after what happened last time #{$user.name}..\n"
    travel_or_edit
  elsif User.find_by(name: input) == nil
    puts "couldn't find that name, try again"
    login_or_signup
  end
end

def travel_or_edit
  puts "                           MAIN MENU:"
  prompt = TTY::Prompt.new
  menu = ["edit Bag","go on a trip","exit"]
  input = prompt.select("what would you like to do today?", menu)
  if input == menu[0]
    edit_bag
  elsif input == menu[1]
    travel
  elsif input == menu[2]
    augumon
    exit
  end
end

def edit_bag
  $user.reload
  prompt = TTY::Prompt.new
  # puts "BAG MENU:"
  menu = ["look at my collected digimons","empty bag", "return to previous menu"]
  choice = prompt.select("what would like to do?", menu)
  if choice == menu[0]
    if $user.digimons == []
      puts "your bag is empty!"
    else
      edit_bag_digimon_list
    end
    sleep 1
    edit_bag
  elsif choice == menu[1]
    $user.digimons.destroy_all
    puts "bag has been emptied"
    sleep 1
    edit_bag
  elsif choice == menu[2]
    # system "clear"
    travel_or_edit
  end
end

def edit_bag_digimon_list
  puts "\nall the digimons you've collected:"
  $user.reload
  $digi_list = digimon_names($user.digimons)
  puts $digi_list
  prompt = TTY::Prompt.new
  puts ""
  menu = ["select one digimon", "sort list by hp","sort list by attack","sort list by defense", "return to previous menu"]
  choice = prompt.select("", menu)
  if choice == menu[0]
    select_digimon
  elsif choice == menu[1]
    sort_digimons_by_hp($user.digimons)
    edit_bag_digimon_list
  elsif choice == menu[2]
    sort_digimons_by_attack($user.digimons)
    edit_bag_digimon_list
  elsif choice == menu[3]
    sort_digimons_by_defense($user.digimons)
    edit_bag_digimon_list
  elsif choice == menu[-1]
    edit_bag
  end
end

def select_digimon
  prompt = TTY::Prompt.new
  digi_name = prompt.select("select one:", digimon_names($user.digimons))
  chosen_digi = $user.digimons.find_by(name: digi_name)
  puts "\nyou selected #{chosen_digi.name}"
  show_stats(chosen_digi)
  puts "\n "
  evolve_digimon(chosen_digi)
end

def evolve_digimon(digimon)
  puts "#{digimon.name} is jumping on you and trying to tell you something.."
  sleep 1
  puts "it could be trying to 🧬 evolve 🧬 .."
  sleep 1
  prompt = TTY::Prompt.new
  choice = prompt.yes?("would you like to try?")
  if choice == true
    if digimon.has_evo == false || digimon.evolution_id == 0 || digimon.evolution_id > 120
      sleep 1
      puts "..."
      sleep 1
      puts "won't happen, #{digimon.name} isn't ready to evolve 😞"
    else
      sleep 1
      puts "#{digimon.name} starts glowing ..!?"
      update_evolve_digimon(digimon)
      sleep 1
      puts "\n wow! your digimon has evolved into a #{digimon.name}!"
    end
    edit_bag_digimon_list
  elsif choice == false
    edit_bag_digimon_list
  end
end

def update_evolve_digimon(digimon)
  #digi_card_id are the id numbers from the original json file
  evolution = Digimon.find_by(digi_card_id: digimon.evolution_id)
  digimon.update(
    digi_card_id: evolution.digi_card_id,
    name: evolution.name,
    race: evolution.race,
    hp: evolution.hp,
    attack: evolution.attack,
    defense: evolution.defense,
    main_skill: evolution.main_skill,
    bio: evolution.bio,
    has_evo: evolution.has_evo,
    evolution_id: evolution.evolution_id,
    location_id: evolution.location_id
  )
end

################## mini HELPER FUNCTIONS ####################################

def digimon_names(digimons)
  digimons.map(&:name)
end

def sort_digimons_by_hp(digimons)
  sorted = digimons.sort_by(&:hp)
  sorted.each {|digi| puts "#{digi.name}, hp: #{digi.hp}"}
end

def sort_digimons_by_attack(digimons)
  sorted = digimons.sort_by(&:attack)
  sorted.each {|digi| puts "#{digi.name}, attack: #{digi.attack}"}
end

def sort_digimons_by_defense(digimons)
  sorted = digimons.sort_by(&:defense)
  sorted.each {|digi| puts "#{digi.name}, defense: #{digi.defense}"}
end

#######################################################

def travel
  prompt = TTY::Prompt.new
  location = prompt.select("Which island would you like to visit?", Location.all.map(&:name) << "return to main menu")
  if location == "return to main menu"
    # system "clear"
    travel_or_edit
  else
    chosen_location = Location.find_by(name: location)
    travel_footsteps(chosen_location)
    wild_digimon_stats(chosen_location)
  end
end

def wild_digimon_stats(location)
  prompt = TTY::Prompt.new
  digi_name = prompt.select("choose one of them to learn more:",location.digimons.map(&:name))
  chosen_digi = Digimon.find_by(name: digi_name)
  show_stats(chosen_digi)

  menu = ["yes, collect!!!!!!!", "no, return to islands", "let me check the other wild digimons"]
  choice = prompt.select("so..would you like to collect this digimon?",menu)
  if choice == menu[0]
    sleep 1
    #### TRIVIA  START ###
    if run_game == true
      Digicard.create(digimon: chosen_digi, user: $user)
      sleep 1
      puts "Digimon collected"
      puts "returning you to the main menu"
      # system "clear"
      travel_or_edit
      ##TRIVIA END ##
    else
      wild_digimon_stats(location)
    end
  elsif choice == menu[1]
    puts "\n Ok. Returning you to the island menu"
    travel
  elsif choice == menu[2]
    puts "\n Ok. Returning you to the wild Digimon list"
    wild_digimon_stats(location)
  end
end

def travel_footsteps(location)
  puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
  sleep 1
  puts "       ..🐾"
  sleep 1
  puts "                                 ..🐾"
  sleep 1
  puts "                                                                   ..🐾"
  sleep 1
  puts "                                                                                                       ..🐾"
  sleep 1
  puts "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
  puts "the digimons at #{location.name} surround you curiously....\n"
end

def show_stats(digimon)
  puts ""
  puts "                          STATS                           "
  # puts " ----------------------------------------------------------- "
  puts "                       name: | #{digimon[:name]}         "
  puts "                         hp: | #{digimon[:hp]}           "
  puts "                        bio: | #{digimon[:bio]}          "
  puts "                       race: | #{digimon[:race]}         "
  puts "                     attack: | #{digimon[:attack]}       "
  puts "                    defense: | #{digimon[:defense]}      "
  puts "                 main skill: | #{digimon[:main_skill]}   "
  puts "  part of an evolution tree: | #{digimon[:has_evo]}      "
  puts ""
  sleep 1
end

def augumon
  puts "
                                          ........................................................... .....  .............
                                          .......................................................... .....  ..............
                                          .......................................................  .,+?..  :~. . .........
                                          ..........................................................+=I....=?~ ... .......
                                          .................................... .. ............  ...,I:==..I~=?. .=:.......
                                          ................................................ ....++.,7,,=+.?=,=7..I+I.......
                                          ....................................... ............$:=,??,:++:?,,+I,+?=I.......
                                          ...................................................$?:?7+:,:?$I,,,+I?7~+I.......
                                          .............................,$7II==+++=I$Z$?,.....7:~ID:..~IZ:,,~?Z7=~?I.......
                                          ............................$I?I$ZI+I7ZOI++?IZ=...++,IO7,,,=77,.,=I$+:=7I.......
                                          ..........................:Z?++$I+??$8I++??I?IZ+.,O+~O+++?I7$8OI?I$O::+7,.......
                                          ........................ .7$+++?++++77++?IIIII$Z.=$I$O+++++?Z87+??7O7IZ=........
                                          ..........................~Z++++++??I+?+7OI$D877$=Z?$Z++?+?I8$????Z8$IZ=........
                                          ...........................Z?+++++??++?7OOZI$D7IZ=$I$Z++++?ZO?++?Z8$I78,........
                                          ..........................=$?++++++++?IZZDMZ$77IO?OIZ$++++787?+?$O7I78~.........
                                          .......................,.,ZI++++++++?I788=77DIIIO$O$I+++++I7+??ZOI7$O:..........
                                          ....................,:,.,$?++++++++?II7Z8NN87777Z+O?+++?++?++??$$$O+............
                                          ..................:~:.,77?=+=+++++??$7II77$$I?7$$Z7??+++??+?7IIZO+..............
                                          ................,:~,.:Z+?+++++?????????IIII$7I$ODOI?+I??$7?III$:................
                                          ...............,~:...7?I7I?+I7????+?????I$Z$??$8877?+?I8??II$7..................
                                          ..............,~:.....+$77I?I$I??+++??ZZ7$I?I7OD7I???OZIII$87...................
                                          .............:~:......:++?+???++?+=+7OI?I7Z8DN87??I$7I7O8Z......................
                                          ...........,:~~,.......~7Z$777I7ZZ$$7?$OOOO$OZ77?III$88O$$Z~....................
                                          ...........::~:..........+I7?7$II?+$8$OZ??+II?II7Z8D8I??$77ZZI,.................
                                          ......,,.,,,:~,.............+II7ZZ8$II??777$788Z87.:7O88OO$?IIZ~,...............
                                          .......:~:,,:~:...................IDOZZOO$OZ$77$Z=....?7I+????I$Z...............
                                          .,:.....::,,:~~..................~8?+??????+???I$Z,..=7~=7+?ZI+I7+..............
                                          ...:==~:::,.,:~~:,..............,O7====~~=?I?=?I?7Z.?,.,,7+IO+???O..............
                                          ....:==~~~:,..,:::~~=~~~~~~~~==~~:,:~~==?Z?7+++?I7O?=,.~IZ78III?+$O:............
                                          ......:~~::,...........,,,.,,,,..,:?I+??Z???+++?7$ZI~=$=,~DZ=,,+Z$O7............
                                          .......,~~:::,,,,,,....,,:::,,:=++??887787?I+???$7Z??~...,D?,,:?ZOI7,...........
                                          ...:~==~~~~~~~~~~::~===~~~:~~~I+??IOOZNMN$?I??7$7I7.......$:,~+$Z?O$,...........
                                          ...................,:~~:,...,~?++??7ONMMMNZ???I$ZO.......+=,~?$I=+$=............
                                          ...............::~:,..........+IZ77?D$ZNNI?ZZ$OOZO.......I::IOI:~??.............
                                          ................................I~?~Z~ZN8??I$I7ZI?$.....,?=ZMI~:+$,.............
                                          ................................+I=$~~8=Z~?IZ??$$I$:... .?MMM~:+$...............
                                          ................................,:I7+$..+~=D$:+Z+,?,.....?8??~?=. ..............
                                          ....................................:..,+,+=Z,:Z=,::..... ..?+, ................
                                          .................................  .....I==.?,=~=,,,...... .... ................
                                          ................................... ....~,..:~+..+=........   ..................
                                          .......................................... .....................................
                                          ....................................... ........ ...............................
                                          ................................................................................
"
end

def mini_game
  puts "MINI GAME:"

  prompt = TTY::Prompt.new
  input = prompt.yes?("Are you ready to play?")
  if input == true

  else
    travel_or_edit
  end
end
