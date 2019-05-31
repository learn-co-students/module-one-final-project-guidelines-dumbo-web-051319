### create examples in here to save time
# require 'pry'
# require_relative '../config/environment'

  Digicard.destroy_all
  Digimon.destroy_all
  User.destroy_all
  Location.destroy_all

def create_digis_and_assign_location

  digi_hash = get_digimons

  digi_hash.each do |digi_id, value|

      Digimon.create(
        digi_card_id: digi_id,
        name: value[:name],
        race: value[:race],
        hp: value[:hp],
        attack: value[:attack],
        defense: value[:defense],
        main_skill: value[:main_skill],
        bio: value[:bio],
        has_evo: value[:has_evo],
        evolution_id: value[:evolution_id]
        )
  end

  #SETS DIGIMON RACE TO LOCATION

  d_summit = Location.create(name: "🐲 🔥 Dracarys Summit 🔥 🐲")
  dragons = Digimon.where(race: "Dragon")
  dragons.each {|item| item.update(name: "🔥 " + item.name)}
  d_summit.digimons = dragons

  camelot = Location.create(name: "🏯 ⚔️ Camelot ⚔️ 🏯")
  knights = Digimon.where(race: "Knight")
  knights.each {|item| item.update(name: "⚔️ " + item.name)}
  camelot.digimons = knights

  b_plains = Location.create(name: "🌳 Breezy Plains 🌳")
  natures = Digimon.where(race: "Nature")
  natures.each {|item| item.update(name: "🌿 " + item.name)}
  b_plains.digimons = natures

  n_voids = Location.create(name: "♞ The Nefarious Voids ♞")
  darks = Digimon.where(race: "Dark")
  darks.each {|item| item.update(name: "✸ " + item.name)}
  n_voids.digimons = darks

  sanctuary = Location.create(name: "🔆 ⚜️ The Sanctuary ⚜️ 🔆")
  holys = Digimon.where(race: "Holy")
  holys.each {|item| item.update(name: "✨ " + item.name)}
  sanctuary.digimons = holys

end

create_digis_and_assign_location

tess = User.create(name: "Tess")
kenton = User.create(name: "Kenton")

first_card = Digicard.create(digimon: Digimon.first, user: tess)
second_card = Digicard.create(digimon: Digimon.second, user: tess)
third_card = Digicard.create(digimon: Digimon.third, user: tess)


# binding.pry
