require_relative '../config/environment'

prompt = TTY::Prompt.new

##### GREETING/SIGN IN ######
# greeting, welcome to our app! (sleep feature)

### IMPORTANT !!!!! ####
result = prompt.collect do
  key(:name).ask('What is your name?')
  # Ask user for their name
   # if name is in the database, skip age question
   # if not in the database, continue on with age question
   # when we get.chomp name, make sure to upcase
  key(:age).ask('What is your age?', convert: :int)
end

#### MENU ######

#add menu here
  # store record
  # check record
  # update record
  # delete record?
  # log out?

##### STORE RECORD #####

# What illness do you have?
  # saves this illness and it gets added to that users diseases(name)
# Can you describe it?
  # saves the diseases(description)
# Who was your doctor:
  # gives user list of doctor to choose from with their specialty
  # optional: description
# What month and year did you visit your doctor?
  # takes the month and date and adds it to disease(:year_month)
# Great, here is your new record!
  # returns illness name, description, doctor, hospital
  # give when they got treated

##### CHECK RECORD #####
  # What do you want to check?
    # All records
      # gives the entire list of that users disease, doctor,date and month, and the hospital
    # List of your doctors
      # gives a list of all your doctors with the date and month and their specialty that treated the user
    # List of your hospital
      # gives a list of all your hospitals with the date and month of that user
    # My lastest check/record
      # returns that latest entry

##### UPDATE RECORD #####
  # Choose which illness status you want to update
    # gives a list of the disease name with the date
    # CHOOSE: are you cured? Y/N
      # this updates the disease boolean that was previously set to FALSE
    # returns the disease name with the boolean result (see if we can use "cured"/ "not cured" as boolean names)

##### DELETE ENTRY #####
  # Do you want to delete a single record or all records?
    # Single Record
      # returns a list of every thing in disease row belonging to that user (presents as option)
      # able to pick a single entry and then uses delete method of that choice
    # All Records
      # are you sure you want to delete everything? (y/n)
      # are you REALLY sure you want to delete everything? (y/n)
      # if yes, use the delete_all method
      # if not, bring back to menu

##### LOG OUT? ######
  # Alright then feel better! 
    # quits out app


puts "HELLO WORLD"
