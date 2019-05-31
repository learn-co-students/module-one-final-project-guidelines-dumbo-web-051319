require_relative '../config/environment'
require 'pry'

prompt = TTY::Prompt.new(active_color: :yellow)
spinner = TTY::Spinner.new("[:spinner] Loading ....", format: :spin_2)

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
      # add progress bar #
        spinner.auto_spin
        sleep(3)
        spinner.success("(Saved!)")
        sleep(2)
      puts "Now that we've set your account up, tell us a little more about yourself."
      sleep(2)
      patient_age = prompt.ask('What is your age?', convert: :int)
      sleep(1)
      patient_conditions = prompt.ask("Please tell us about any pre-existing condition(s) you have.")

      user = Patient.create(name: patient_name, age: patient_age, previous_conditions: patient_conditions, password: patient_password)
      # add progress bar #
        spinner.auto_spin
        sleep(3)
        spinner.success("(Profile Created!)")
        sleep(2)
      system "clear"
      sleep(2)
      puts "Great! Welcome #{user.name}, your ID is #{user.id}. Please remember your password and ID to sign into Medical Tracker in the future!"
      # add progress bar #
      sleep(2)

 ###### GREETING -> SIGN IN ######
    elsif choice == "Sign-In"
      sleep(1)
      patient_id = prompt.ask("Please enter your ID")
      patient_password = prompt.mask("Please enter your password")

       user = Patient.find_by(password: patient_password) && Patient.find(patient_id)
         if user
           # add progress bar #
           sleep(0.5)
           spinner.auto_spin
           sleep(3)
           spinner.success("(Logged in!)")
          sleep(2)
          system "clear"
          puts "                     --------------------------------"
          puts "                    |      Welcome back #{user.name}!     |"
          puts "                     --------------------------------"
          sleep(2)
        else
          # add progress bar #
          sleep(0.5)
          spinner.auto_spin
          sleep(3)
          spinner.error("(Error)")
          sleep(2)
          puts "Oh no, looks like we didn't find you... please try again"
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
      puts "Let's create a record together"
      sleep(2)
      record_illness = prompt.ask("What type of illness did you have?")
      sleep(1)
      record_description = prompt.ask("Please describe how you felt?")
      sleep(1)
      doc_name = prompt.ask("Who was your doctor?")
      sleep(1)
      doc_specialty = prompt.ask("What was their specialty?")
      sleep(1)
      doc_hospital = prompt.ask("Where were you treated?")

      doc = Doctor.create(name: doc_name, specialty: doc_specialty, hospital: doc_hospital)
      new_record1 = Record.create(illness: record_illness, description: record_description, cured: false)

      user.records << new_record1
      doc.records << new_record1
        # add progress bar #
        sleep(0.5)
        spinner.auto_spin
        sleep(3)
        spinner.success("(Record Created!)")
        sleep(2)
      puts "Here's your new record!"
      sleep(2)
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
      sleep(5)

    ###### MY RECORDS ######
    elsif menu_choice == "My-Records"
      if user.records.empty?
          # add progress bar #
          sleep(0.5)
          spinner.auto_spin
          sleep(3)
          spinner.error("(Record Not Found)")
          sleep(2)
          # end progress bar #
        puts "Hmm...looks like you have no records"
      else
        sleep(2)

      record_choice = prompt.select("What would you like to view?", %w(All-Records Doctors Hospitals Recent-Record Back-to-Menu))
        ###### MY RECORDS -> ALL RECORDS ######
        if record_choice == "All-Records"
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Found Records!)")
            sleep(2)
            # end progress bar #
          user.records.map do |x|
            puts "--------------------------------"
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
            sleep(2)
          end

        ###### MY RECORDS -> DOCTORS ######
        elsif record_choice == "Doctors"
            # add progress bar#
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Found Records!)")
            sleep(2)
            # end progress bar #
          my_doctors = user.records.map {|x| x.doctor.name}.uniq
          puts "--------------------------------"
          my_doctors.each_with_index {|docs, index| puts "          #{index + 1}. #{docs}"}
          puts "--------------------------------"
          sleep(2)

        ###### MY RECORDS -> RECENT RECORD ######
        elsif record_choice == "Recent-Record"
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Found Record!)")
            sleep(2)
            # end progress bar #
          my_last = user.records.last
          puts "--------------------------------"
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
          puts "--------------------------------"
          sleep(2)
        elsif record_choice == "Hospitals"
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Found Records!)")
            sleep(2)
            # end progress bar #
          my_hospitals = user.records.map {|x| x.doctor.hospital}.uniq
          puts "These are the hospitals you were treated at: "
          puts "--------------------------------"
          my_hospitals.each_with_index {|hospital, index| puts "          #{index + 1}. #{hospital}"}
          puts "--------------------------------"
        else record_choice == "Back-to-Menu"
          menu_choice
          sleep(2)
        end #(belongs to My Record option choices)#
      end

      ##### UPDATE RECORD ########
      elsif menu_choice == "Update-Records"
        sleep(2)
        if user.records.empty?
            # add progress bar #
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.error("(Record Not Found)")
            sleep(2)
            # end progress bar #
          puts "Hmm...looks like you have no records"
        else
          sleep(2)
          my_illnesses = user.records.map {|x| "#{x.id}: #{x.illness}"}
          illness_choice = prompt.select("Please choose a record to update", my_illnesses)
            # add progress bar #
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Record Selected!)")
            sleep(2)
          end
          update_choice = prompt.select("What would you like to update about this record?", %w(Cure-Status Illness Description Back-to-Menu))
            ##### UPDATE RECORD -> CURE STATUS ########
            if update_choice == "Cure-Status"
              # add progress bar #
              sleep(0.5)
              spinner.auto_spin
              sleep(3)
              spinner.success("(Changing Cure Status)")
              # end progress bar #
                update_id = illness_choice.split(":")
                illness_instance = update_id[0]
                update_instance = user.records.find_by_id(illness_instance)
                update_instance.update(cured: true)
                user.reload

                sleep(2)
                puts "--------------------------------"
                puts "Great! Your status have been updated"
                puts "--------------------------------"

            ##### UPDATE RECORD -> RECORD NAME ########
            elsif update_choice == "Illness"
              sleep(2)
              update_illness = prompt.ask("Please give your illness a new name.")
                update_id = illness_choice.split(":")
                illness_instance = update_id[0]
                update_instance = user.records.find_by_id(illness_instance)
                update_instance.update(illness: update_illness)
                user.reload
                  # add progress bar #
                  sleep(0.5)
                  spinner.auto_spin
                  sleep(3)
                  spinner.success("(Changing Cure Status)")
                  # end progress bar #
                sleep(2)
                puts "--------------------------------"
                puts "Great! Your record name have been updated"
                puts "--------------------------------"

            ##### UPDATE RECORD -> DESCRIPTION ########
            elsif update_choice == "Description"
              sleep(2)
              update_description = prompt.ask("Please rewrite your symptoms for this record")
                update_id = illness_choice.split(":")
                illness_instance = update_id[0]
                update_instance = user.records.find_by_id(illness_instance)
                update_instance.update(description: update_description)
                user.reload
                  sleep(0.5)
                  spinner.auto_spin
                  sleep(3)
                  spinner.success("(Changing Illness Name)")
                puts "--------------------------------"
                puts "Great! Your description have been updated"
                puts "--------------------------------"

              ##### UPDATE RECORD -> BACK TO MENU ########
              else update_choice == "Back-to-Menu"
                menu_choice
            end

      ###### DELETE RECORDS ######
      elsif menu_choice == "Delete-Records"
        if user.records.empty?
            # add progress bar #
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.error("(Record Not Found)")
            sleep(2)
            # end progress bar #
          puts "Hmm...looks like you have no records to delete"
        else
          sleep(2)
          delete_choice = prompt.select("Do you want to delete a single record or all records?", %w(Single-Record? All-Records? Back-to-Menu))
        end
        ###### DELETE RECORDS -> All RECORDS? ######
        if delete_choice == "All-Records?"
          answer = prompt.yes?("Are you sure you want to delete everything?")
          # binding.pry
          if answer == true
          user.records.destroy_all
            # add progress bar #
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Deleting Record)")
            sleep(3)
            # add progress bar #
          puts "--------------------------------"
          puts "You've successfully deleted all records"
          puts "--------------------------------"
          sleep(2)
        else
          sleep(2)
          puts "Phew..." if answer == false
        end
        ###### DELETE RECORDS -> SINGLE RECORD? ######
        elsif delete_choice == "Single-Record?"
          my_illnesses = user.records.map {|x| "#{x.id}: #{x.illness}"}
          illness_choice = prompt.select("Please choose which record you want ", my_illnesses)
          delete_id = illness_choice.split(":")
          illness_instance = delete_id[0]
          user.records.find_by_id(illness_instance).delete
          user.reload
            # add progress bar #
            sleep(0.5)
            spinner.auto_spin
            sleep(3)
            spinner.success("(Deleting Record)")
            sleep(3)
            # add progress bar #
          puts "--------------------------------"
          puts "You've successfully deleted 1 record"
          puts "--------------------------------"
          sleep(2)

        ###### DELETE RECORDS -> BACK TO MENU ######
        else delete_choice == "Back-to-Menu"
          menu_choice
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
