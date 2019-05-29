require 'json'
require 'pry'

## only uses digimons data from 1- 120

def evolution_data
## reads evolution json (1-120 digimons) and parses
evo_file = File.read("#{__dir__}/../dh-data/json/tree-0002-0120.json")
evo_data = JSON.parse(evo_file)
end
#
def stats_data
## reads stats json (1-120 digimons) and parses
list_file = File.read("#{__dir__}/../dh-data/json/list-0001-0120.json")
list_data = JSON.parse(list_file)
end

def get_digimons

  ## CREATING A NEW HASH TO TAKE ONLY THE DATA WE WANT FROM PARSED EVOLUTION HASH
  digi_evo = {}

  evolution_data.each do |key,value|
    if evolution_data[key].include?("evolution")
    digi_evo[key.to_i] = {
      has_evo: value["has_evolution_tree"],
      evolution_id: value["evolution"].keys[-1].to_i
    }
    else
    digi_evo[key.to_i] = {
      has_evo: value["has_evolution_tree"],
      evolution_id: 0
    }
    end
  end

## CREATING A NEW HASH TO TAKE ONLY THE DATA WE WANT FROM PARSED STATS LIST HASH
## digi_hash IS THE FINAL HASH

digi_hash = {}

stats_data.each do |key, value|
  digi_hash[key.to_i] = {
    name: value["name"],
    race: value["main_race"],
    hp: value["hp"].to_i,
    attack: value["attack"].to_i,
    defense: value["defense"].to_i,
    main_skill: value["main_skill"],
    bio: value["profile"]
  }
end

## ADDS VALUES FOR THE DIGIMONS THAT HAVE NO EVOLUTION/ARENT IN THE EVO FILE

  no_evo = {
    has_evo: false,
    evolution_id: 0
  }

  ## MERGES THE HASHES TOGETHER INTO digi_hash

  digi_hash.each do |mainkey, mainvalue|
    digi_evo.each do |evokey, evovalue|
      if mainkey == evokey
        mainvalue.merge!(evovalue)
      elsif digi_evo.keys.include?(mainkey) == false
        mainvalue.merge!(no_evo)
      end
    end
  end
digi_hash
end

# data = get_digimons
#
# binding.pry
#
# puts 1


  #### DETERMINING WHAT KIND OF TYPES THERE ARE:
  #### DRAGON, KNIGHT, NATURE, DARK, AND HOLY

# type_array = []
#
#   digi_hash.each do |key, value|
#     type_array << value[:race]
#   end
#
#   type_array.uniq


# IF I EVER WANT TO ADD SEVERAL FILES USE THIS
# data = {}
#
# Dir.glob('./dh-data/json/*.json') do |f|
#    file = File.read(f)
#    data.merge! JSON.parse(file)
# end
#
# data.keys.map {|string_id| string_id.to_i}
#
