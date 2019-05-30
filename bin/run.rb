require_relative '../config/environment'
require 'pry'

prompt = TTY::Prompt.new(active_color: :yellow)


###### GREETING/LOGIN ######
user = nil
while user == nil
  puts "
                ___  __     __               ___  __        __        ___  __
          |\\/| |__  |  \\ | /  `  /\\  |        |  |__)  /\\  /  ` |__/ |__  |__)
          |  | |___ |__/ | \\__, /~~\\ |___     |  |  \\ /~~\\ \\__, |  \\ |___ |  \\

                                        🏥 🏥 🏥

                                ,.........   .........,
                           ,..,'          '.'          ',..,
                         ,' ,'             :             ', ',
                        ,' ,'              :              ', ',
                       ,' ,'............., : ,.............', ',
                      ,'  '............   '.'   ............'  ',
                       '''''''''''''''''';''';''''''''''''''''''
                                          '''"
  sleep(1.5)
  choice = prompt.select("Hello, welcome to Medical Tracker", %w(Sign-Up Sign-In Quit?))

  ###### GREETING -> SIGN UP  ######
    if choice == "Sign-Up"
      sleep(1)
      patient_name = prompt.ask("What is your name?")
      sleep(1)
      patient_password = prompt.mask("Thanks #{patient_name}! Please enter a new password that we can use to remember you.")
      sleep(2)
      # add progress bar #
      puts "Now that we've set your account up, tell us a little more about yourself."
      sleep(1)
      patient_age = prompt.ask('What is your age?', convert: :int)
      sleep(1)
      patient_conditions = prompt.ask("Please tell us about any pre-existing condition(s) you have.")

      user = Patient.create(name: patient_name, age: patient_age, previous_conditions: patient_conditions, password: patient_password)
      #a dd progress bar #
      sleep(2)
      puts "Great! Welcome #{user.name}. Please remember your password to sign into Medical Tracker in the future!"
      system "clear"

 ###### GREETING -> SIGN IN ######
    elsif choice == "Sign-In"
      sleep(1)
      patient_password = prompt.mask("Please enter your password")
       user = Patient.find_by password: patient_password
         if user
           # add progress bar #
          sleep(2)
          puts "--------------------------------"
          puts "Welcome back #{user.name}!"
          puts "--------------------------------"
        else
          sleep(2)
          puts "Oh no, looks like we didn't find you...please try again"
          sleep(3)
          system "clear"
      end   #(searching for password match)#

 ###### QUIT? ######
    else choice == "Quit?"
      sleep(1.5)
      puts "We hope to see you soon!"
      sleep(1.5)
      exit
  end #(choice if statements for login menu)#

end #(belongs to user while statement)#


###### MENU ######
menu_choice = nil
while menu_choice != "Log-Out?"
  menu_choice = prompt.select("How can we help you today?", %w(Create-Record My-Records Update-Records Delete-Records Log-Out?))

    ###### CREATE RECORDS ######
    if menu_choice == "Create-Record"
      record_illness = prompt.ask("What type of illness do you have?")
      record_description = prompt.ask("Please describe how you felt?")
      doc_name = prompt.ask("Who was your doctor?")
      doc_specialty = prompt.ask("What was their specialty?")
      doc_hospital = prompt.ask("Where were you treated?")

      doc = Doctor.create(name: doc_name, specialty: doc_specialty, hospital: doc_hospital)
      new_record1 = Record.create(illness: record_illness, description: record_description, cured: false)

      user.records << new_record1
      doc.records << new_record1

      puts "Here's your new record!"
      sleep(1)
      puts "--------------------------------"
      puts "Illness: #{new_record1.illness}"
      if new_record1.cured == false
        puts "Cured?: Not Cured"
      else
        puts "Cured?: Cured"
      end
      puts "Description: #{new_record1.description}"
      puts "Doctor: #{doc.name}"
      puts "Hospital: #{doc.hospital}"
      puts "Date: #{new_record1.created_at}"
      puts "--------------------------------"
      sleep(3)

    ###### MY RECORDS ######
    elsif menu_choice == "My-Records"
      record_choice = prompt.select("What would you like to view?", %w(All-Records Doctors Hospitals Recent-Record))

        ###### MY RECORDS -> ALL RECORDS ######
        if record_choice == "All-Records"
          if user.records.empty?
            puts "Hmm...looks like you have no records"
          end
          user.records.map do |x|
            puts "----------"
            puts "Illness: #{x.illness}"
            if x.cured == false
              puts "Cured?: Not Cured"
            else
              puts "Cured?: Cured"
            end
            puts "Description: #{x.description}"
            puts "Doctor: #{x.doctor.name}"
            puts "Hospital: #{x.doctor.hospital}"
            puts "Date: #{x.created_at}"
            puts "----------"
            sleep(1)
          end

        ###### MY RECORDS -> DOCTORS ######
        elsif record_choice == "Doctors"
          if user.records.empty?
            puts "Hmm...looks like you have no doctors"
          end
          my_doctors = user.records.map {|x| x.doctor.name}.uniq
          my_doctors.each_with_index {|docs, index| puts "#{index + 1}. #{docs}"}

        ###### MY RECORDS -> RECENT RECORD ######
        elsif record_choice == "Recent-Record"
          my_last = user.records.last
          puts "Illness: #{my_last.illness}"
          if my_last.cured == false
            puts "Cured?: Not Cured"
          else
            puts "Cured?: Cured"
          end
          puts "Description: #{my_last.description}"
          puts "Doctor: #{my_last.doctor.name}"
          puts "Hospital: #{my_last.doctor.hospital}"
          puts "Date: #{my_last.created_at}"
        else record_choice == "Hospitals"
          my_hospitals = user.records.map {|x| x.doctor.hospital}.uniq
          my_hospitals.each_with_index {|hospital, index| puts "#{index + 1}. #{hospital}"}
        end #(belongs to My Record option choices)#

      ##### UPDATE RECORD ######## 
      elsif menu_choice == "Update-Records"
        if user.records.empty?
          puts "Hmm...looks like you have no records"
        else
          my_illnesses = user.records.map {|x| "#{x.id}: #{x.illness}"}
          illness_choice = prompt.select("records", my_illnesses)
          update_id = illness_choice.split(":")
          illness_instance = update_id[0]
          update_instance = user.records.find_by_id(illness_instance)
          # binding.pry
          update_instance.update(cured: true)
          user.reload
          # binding.pry
          # user.records.find_by_id(update_instance.id).save

          # update_instance.update
        end

        
        
      ###### DELETE RECORDS ######
      elsif menu_choice == "Delete-Records"
        delete_choice = prompt.select("Do you want to delete a single record or all records?", %w(Single-Record? All-Records?))

        ###### DELETE RECORDS -> All RECORDS? ######
        if delete_choice == "All-Records?"
          answer = prompt.yes?("Are you sure you want to delete everything?")
          # binding.pry
          user.records.destroy_all if answer == true
          puts "Phew..." if answer == false
        
        ###### DELETE RECORDS -> SINGLE RECORD? ######
        else delete_choice == "Single-Record?"
          if user.records.empty?
            puts "Hmm...looks like you have no records"
          else
            my_illnesses = user.records.map {|x| "#{x.id}: #{x.illness}"}
            illness_choice = prompt.select("records", my_illnesses)
            delete_id = illness_choice.split(":")
            illness_instance = delete_id[0]
            user.records.find_by_id(illness_instance).delete
            user.reload
          end
      end #(belongs to Delete Records menu choices)#

      ###### LOG OUT? ######
      else menu_choice == "Log-Out?"
        sleep(1.5)
        puts "Hope you feel better!"
        sleep(1.5)
        exit
    end

end #(belongs to while != logout statement in menu)#
puts "HELLO WORLD"
