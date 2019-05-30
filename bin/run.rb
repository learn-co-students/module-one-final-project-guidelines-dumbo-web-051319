require_relative '../config/environment'
require 'pry'

prompt = TTY::Prompt.new

##### GREETING/SIGN IN ######
user = nil
while user == nil

choice = prompt.select("Hello, Welcome to Medical Tracker", %w(Sign-Up Sign-In Quit?))
sleep(1)
  if choice == "Sign-Up"

  ### SIGN UP  ###
    patient_name = prompt.ask("What is your name?")
    patient_password = prompt.mask("Please enter a new password")
    patient_age = prompt.ask('What is your age?', convert: :int)
    patient_conditions = prompt.ask("Tell us a little bit about your pre-existing conditions.")

    user = Patient.create(name: patient_name, age: patient_age, previous_conditions: patient_conditions, password: patient_password)

    puts "Great! Welcome #{user.name}, here's your id: #{user.id}. Please remember this to sign-in in the future!"

### SIGN IN ###
  elsif choice == "Sign-In"
    patient_password = prompt.mask("Please enter your password")
     user = Patient.find_by password: patient_password
     if user
      puts "Welcome back #{user.name}!"
    else
      puts "Oh no, looks like we didn't find you...please try again"
    end

  else choice == "Quit?"
    exit
  end
end


#### MENU ######
menu_choice = nil
while menu_choice != "Log-Out?"
  menu_choice = prompt.select("How can we help you today?", %w(Create-Record My-Records Update-Records Delete-Records Log-Out?))
    #### CREATE RECORDS ####
    if menu_choice == "Create-Record"
      record_illness = prompt.ask("What type of illness do you have?")
      record_description = prompt.ask("Please describe how you felt?")
      doc_name = prompt.ask("Who was your doctor?")
      doc_specialty = prompt.ask("What was their specialty?")
      doc_hospital = prompt.ask("Where were you treated?")

      doc = Doctor.create(name: doc_name, specialty: doc_specialty, hospital: doc_hospital)
      new_record1 = Record.create(illness: record_illness, description: record_description, cured?: false)

      user.records << new_record1
      doc.records << new_record1

      puts "Here's your new record!"
      sleep(1)
      puts "Illness: #{new_record1.illness}"
      sleep(1)
      puts "Description: #{new_record1.description}"
      sleep(1)
      puts "Doctor: #{doc.name}"
      sleep(1)
      puts "Hospital: #{doc.hospital}"
      puts "Date: #{new_record1.created_at}"

    ##### MY RECORDS #####
    elsif menu_choice == "My-Records"
      record_choice = prompt.select("What would you like to view?", %w(All-Records Doctors Hospitals Recent-Record))

        if record_choice == "All-Records"
          if user.records.empty?
            puts "Hmm...looks like you have no records"
          end
          user.records.map do |x|
            puts "Illness: #{x.illness}"
            puts "Description: #{x.description}"
            puts "Doctor: #{x.doctor.name}"
            puts "Hospital: #{x.doctor.hospital}"
            puts "Date: #{x.created_at}"
            puts "----------"
            sleep(1)
          end
        elsif record_choice == "Doctors"
          if user.records.empty?
            puts "Hmm...looks like you have no doctors"
          end
          my_doctors = user.records.map {|x| x.doctor.name}.uniq
          my_doctors.each_with_index {|docs, index| puts "#{index + 1}. #{docs}"}
        elsif record_choice == "Recent-Record"
          my_last = user.records.last
          puts "Illness: #{my_last.illness}"
          puts "Description: #{my_last.description}"
          puts "Doctor: #{my_last.doctor.name}"
          puts "Hospital: #{my_last.doctor.hospital}"
          puts "Date: #{my_last.created_at}"
        else record_choice == "Hospitals"
          my_hospitals = user.records.map {|x| x.doctor.hospital}.uniq
          my_hospitals.each_with_index {|hospital, index| puts "#{index + 1}. #{hospital}"}
        end
      elsif menu_choice == "Delete-Records"
        delete_choice = prompt.select("Do you want to delete a single record or all records?", %w(Single-Record? All-Records?))
        if delete_choice == "All-Records?"
          answer = prompt.yes?("Are you sure you want to delete everything?")
          # binding.pry
          user.records.destroy_all if answer == true
          puts "Phew..." if answer == false
        end
        if delete_choice == "Single-Record?"
          my_illnesses = user.records.map {|x| "#{x.id}: #{x.illness}"}
          illness_choice = prompt.select("records", my_illnesses)
          delete_id = illness_choice.split(":")
          illness_instance = user.records.find_by delete_id[0]
          binding.pry
          illness_instance.destroy
          # new_hash = {}
          # my_illnesses.each do |ill|
          #   new_hash[ill] = 0
          # end
          # binding.pry
        end

      end


end # belongs to while != logout
puts "HELLO WORLD"
