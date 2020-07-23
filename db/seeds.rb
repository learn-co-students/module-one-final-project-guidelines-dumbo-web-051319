character1 = Character.create(name: "Bilbo", race: "Hobbit", class_name: "Rogue")
character2 = Character.create(name: "Gandalf", race: "Human", class_name: "Wizard")
character3 = Character.create(name: "Chuckee Cheese Monster", race: "Rat", class_name: "Bard")
character4 = Character.create(name: "Sleepy Joe", race: "Human", class_name: "Finance Bro" )

spell1 = Spell.create(name: "Acid Splash", description: "You hurl a bubble of acid.")
spell2 = Spell.create(name: "Absorb Elements", description: "The spell captures some of the incoming energy lessening its effect on you and storing it for your next melee attack.")
spell3 = Spell.create(name: "Acid Arrow", description: "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid.")
spell4 = Spell.create(name: "Animal Messenger", description: "By means of this spell, you use an animal to deliver a message.")
spell5 = Spell.create(name: "Animate Dead", description: "This spell creates an undead servant.")
spell6 = Spell.create(name: "Bored", description: "This spell makes the user and anyone in a 15 foot radius mildly bored, they may start scrolling mindlessly through their phone or watching episodes of The Marvelous Mrs. Maisel. Gets kinda repetitive, not a bad show though, would reccommend.")


spell_list1 = CharacterSpell.create(character_id: character1.id, spell_id: spell1.id)
spell_list2 = CharacterSpell.create(character_id: character2.id, spell_id: spell2.id)
spell_list3 = CharacterSpell.create(character_id: character3.id, spell_id: spell3.id)
spell_list4 = CharacterSpell.create(character_id: character1.id, spell_id: spell4.id)
spell_list5 = CharacterSpell.create(character_id: character2.id, spell_id: spell1.id)
spell_list6 = CharacterSpell.create(character_id: character4.id, spell_id: spell6.id)

user1 = User.create(name: "Otha", password: "Otha")
user2 = User.create(name: "Joe", password: "Joe")
# user1
# user1
# user1
# user1

uchar1 = UserCharacter.create(user_id: user1.id, character_id: character3.id)
uchar2 = UserCharacter.create(user_id: user2.id, character_id: character1.id)
uchar3 = UserCharacter.create(user_id: user2.id, character_id: character2.id)
uchar4 = UserCharacter.create(user_id: user1.id, character_id: character2.id)
uchar5 = UserCharacter.create(user_id: user1.id, character_id: character4.id)

# uchar5
# uchar6
