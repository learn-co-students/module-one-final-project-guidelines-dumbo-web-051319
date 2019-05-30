require 'pry'
class CommandLineInterface

def ruby_clear
  system "clear"
end

      def signing_options
          prompt = TTY::Prompt.new
          choice = prompt.select("Welcome to RoofHopper", ["Log In", "Sign Up"])
          ruby_clear
          if choice == "Sign Up"
                puts "Please enter your name"
                user_name = gets.chomp
                puts "Please enter your email"
                user_email = gets.chomp
                new_user = User.create(name: "#{user_name}", email: "#{user_email}" )
                self.signing_options
                ##something about moving to a different method without the new user
          elsif choice == "Log In"
            # login_email = prompt.ask('What is your email?')
                puts "Please enter your email"
                login_email = gets.chomp
                $user = User.find_by(email: "#{login_email}")
                # binding.pry
                  # if login_email != nil
              if $user != nil && login_email == $user.email
                sleep(1)
                ruby_clear
                puts "Welcome back #{$user.name}"
                sleep(1)
              elsif $user == nil
                puts "Wrong email, please re-enter your email"
                sleep(1)
                self.signing_options
              end
            end
          end

      def home_page
          prompt = TTY::Prompt.new
          choice = prompt.select("",["View Profile", "Book A Roof", "Quit"],active_color: :cyan)
              ##########################################
          if choice == "View Profile"
              choice = prompt.select("", ["Your Reservations", "Update Booking", "Cancel Booking", "Back" ])
              ruby_clear
              ##########################################
              if choice == "Your Reservations"
                if $user.bookings != []
                puts "Here are your reservations"
                puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                $user.bookings.map do |booking|
                puts "Roof Name: #{booking.roof.name} "
                puts "Date: #{booking.date_time} "
                puts "Party Size: #{booking.party_size} "
                puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                end
                self.home_page
                ##########################################
                else
                puts "You have no reservations"
                sleep(1.5)
                self.home_page
                end
              end
                ##########################################
              if choice == "Update Booking"
                choice = prompt.select("",["By Time", "By Party Size", "Back"])
                ##########################################
                if choice == "By Time"
                  if $user.bookings != []
                  puts "Here are your existing reservations"
                  puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                  $user.bookings.map do |booking|
                  puts "Roof Name: #{booking.roof.name} "
                  puts "Date: #{booking.date_time} "
                  puts "Party Size: #{booking.party_size} "
                  puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                  puts "Would you like to update this reservation?"
                  choice = prompt.select("",%w(YES NO))
                    if choice == "YES"
                      puts "What is the new date? (YYYY-MM-DD HH-MI)"
                      user_input = gets.chomp
                      booking.update(date_time: user_input)
                      puts "Updating reservation"
                      sleep(1)
                      puts "📝Reservation Updated📝"
                      self.home_page
                    end
                  end
                  else
                    puts "You have no reservations to update"
                    sleep(1.5)
                    self.home_page
                  end

                  ##########################################
                elsif choice == "By Party Size"
                  if $user.bookings != []
                  puts "Here are your existing reservations"
                  puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                  $user.bookings.map do |booking|
                  puts "Roof Name: #{booking.roof.name} "
                  puts "Date: #{booking.date_time} "
                  puts "Party Size: #{booking.party_size} "
                  puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                  puts "Would you like to update this reservation?"
                  choice = prompt.select("",%w(YES NO))
                    if choice == "YES"
                      puts "What is your new party size?"
                      user_input = gets.chomp
                      booking.update(party_size: user_input)
                      puts "Updating reservation"
                      sleep(1)
                      puts "📝Reservation Updated📝"
                      self.home_page
                    end
                  end
                else
                  puts "You have no reservations to update"
                  sleep(1.5)
                  self.home_page
                end
                  end
                elsif choice == "Back"
                  self.home_page
              end
              ##########################################
              if choice == "Cancel Booking"
                if $user.bookings != []
                puts "Here are your existing reservations"
                puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                $user.bookings.map do |booking|
                puts "Roof Name: #{booking.roof.name} "
                puts "Date: #{booking.date_time} "
                puts "Party Size: #{booking.party_size} "
                puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                puts "Would you like to delete this reservation?"
                # puts "Please type in the reservation you would like to cancel"
                choice = prompt.select("",%w(YES NO))
                    if choice == "YES"
                puts "Are you sure about that?!"
                choice = prompt.select("",%w(YES NO))
                    if choice == "YES"
                      booking.delete
                      $user.bookings.reload
                puts "Deleting this reservation"
                puts "❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌"

                sleep(1.5)
                    end
                    end
                end
                self.home_page
                else
                puts "You have no reservations to cancel"
                sleep(1.5)
                self.home_page
                end


            elsif choice == "Back"
              self.home_page
              end

              ##########################################

          elsif choice == "Book A Roof"
              puts "How would you like to book your roof"
              choice = prompt.select("",["Book By Location", "Book By Features", "Back"])

              ##########################################
              if choice == "Book By Location"
                choice = prompt.select("",%w(Manhattan Brooklyn Back))

              ##########################################
                if choice == "Manhattan"
                    puts "🌆🌆🌆🌆🌆🌆🌆🌆🌆🌆"
                  manhattan_roofs= Roof.all.select {|roof|roof.location == "Manhattan" }
                  manhattan_roofs.each do |roof|
                    puts "Name: #{roof.name}"
                    puts "Dress code: #{roof.dress_code}"
                    puts "Price range: #{roof.price_range}/5"
                    puts "Location: #{roof.location}"
                    puts "Entertainment: #{roof.entertainment}"
                    puts "Dog: #{roof.dog}"
                    puts "Food: #{roof.food}"
                    puts "Bar: #{roof.bar}"
                    puts "IG Rating: #{roof.ig_rating}/5"
                    puts "🌆🌆🌆🌆🌆🌆🌆🌆🌆🌆"
                    sleep(0.75)
                  end
                    puts "Please enter the name of your desired roof"
                    booking_name = gets.chomp
                    puts "Please enter the party size"
                    booking_party_size = gets.chomp
                    puts "Please enter the date of your reservation (YY-MM-DD HH-MI)"
                    booking_date = gets.chomp
                    ruby_clear
                    puts "Thank you for using RoofHopper, We are generating your reservation"
                    puts "⏳⏳⏳⏳⏳"
                    sleep(2)
                    # binding.pry
                    roof_id= Roof.find_by(name: booking_name).id
                    $user.bookings.create(roof_id: roof_id,  date_time: booking_date, party_size: booking_party_size)
                    puts "Your reservation has been made and added to your profile"
                    sleep(1.5)
                    self.home_page

                elsif choice == "Brooklyn"
                  puts "🌉🌉🌉🌉🌉🌉🌉🌉🌉🌉"
                brooklyn_roofs= Roof.all.select {|roof|roof.location == "Brooklyn" }
                brooklyn_roofs.each do |roof|
                    puts "Name: #{roof.name}"
                    puts "Dress code: #{roof.dress_code}"
                    puts "Price range: #{roof.price_range}/5"
                    puts "Location: #{roof.location}"
                    puts "Entertainment: #{roof.entertainment}"
                    puts "Dog: #{roof.dog}"
                    puts "Food: #{roof.food}"
                    puts "Bar: #{roof.bar}"
                    puts "IG Rating: #{roof.ig_rating}/5"
                    puts "🌉🌉🌉🌉🌉🌉🌉🌉🌉🌉"
                    sleep(0.75)
                  end
                  puts "Please enter the name of your desired roof"
                  booking_name = gets.chomp
                  puts "Please enter the party size"
                  booking_party_size = gets.chomp
                  puts "Please enter the date of your reservation (YY-MM-DD HH-MI)"
                  booking_date = gets.chomp
                  ruby_clear
                  puts "Thank you for using RoofHopper, We are generating your reservation"
                  puts "⏳⏳⏳⏳⏳"
                  sleep(2)
                  roof_id= Roof.find_by(name: booking_name).id
                  # binding.pry
                  $user.bookings.create(roof_id: roof_id,  date_time: booking_date, party_size: booking_party_size)
                  puts "Your reservation has been made and added to your profile"
                  sleep(1.5)
                  home_page
                elsif choice == "Back"
                end
                self.home_page
                ##########################################
              elsif choice == "Book By Features"
                puts "How would you like to use the roof?"
                choice = prompt.select("",["Bar", "I dont know?", "Back"])
                ##########################################
                if choice == "Bar"
                  # choices = %w(dress_code location entertainment dog food bar price_range)
                  choices = [
                    { name: "Casual Dress Code", value: {dress_code: "Casual"}},
                    { name: "Business Casual Dress Code", value: {dress_code: "Business Casual"}},
                    { name: "Semi-Casual Dress Code", value: {dress_code: "Semi Casual"}},
                    { name: "Casual Dressy Dress Code", value: {dress_code: "Casual Dressy"}},
                    { name: "Manhattan", value: {location: "Manhattan"}},
                    { name: "Brooklyn", value: {location: "Brooklyn"}},
                    { name: "With entertainment", value: {value: "Yes"}},
                    { name: "Without entertainment", value: {value: "No"}},
                    { name: "Allow dog", value: {value: "Yes"}},
                    { name: "No dog", value: {value: "No"}},
                    { name: "Have food", value: {value: "Yes"}},
                    { name: "No food", value: {value: "No"}},
                    { name: "Have bar", value: {value: "Yes"}},
                    { name: "No bar", value: {value: "No"}},
                    { name: "Cheap", value: {price_range: "< 3"}},
                    { name: "Expensive", value: {price_range: "=> 3"}},
                    { name: "Instagramable View", value: {ig_rating: "> 3"}}
                  ]
                  filter_selection = prompt.multi_select("Customize your roof", choices, filter: true)
                  binding.pry
                    Roof.where(filter_selection[0])
                    Roof.where(filter_selection[1])
                    Roof.where(filter_selection[2])
                    Roof.where(filter_selection[3])
                    Roof.where(filter_selection[4])
                    Roof.where(filter_selection[5])
                    Roof.where(filter_selection[6])
                    Roof.where(filter_selection[7])
                    Roof.where(filter_selection[8])
                    Roof.where(filter_selection[9])
                    Roof.where(filter_selection[10])
                    Roof.where(filter_selection[11])
                    Roof.where(filter_selection[12])
                    Roof.where(filter_selection[13])
                    Roof.where(filter_selection[14])
                    Roof.where(filter_selection[15])
                    Roof.where(filter_selection[16])



                   # filtered_roof = Roof.where(dog: "Yes", )
                   # filtered_roof = Roof.where(dog: "Yes", )
                   # puts "#{filtered_roof.map {|roof| roof.name}}"
                  #iterate through this and grab the infos a user would want to see (name, location, whether it is a bar or not )
                end

                ##########################################
              elsif choice == "I dont know?"

                  puts "Here's our reccomended rooftop"
                  random_roof = Roof.all.sample
                  puts "Name: #{random_roof.name}"
                  puts "Roof ID: #{random_roof.id}"
                  puts "Dress code: #{random_roof.dress_code}"
                  puts "Price range: #{random_roof.price_range}/5"
                  puts "Location: #{random_roof.location}"
                  puts "Entertainment: #{random_roof.entertainment}"
                  puts "Dog: #{random_roof.dog}"
                  puts "Food: #{random_roof.food}"
                  puts "Bar: #{random_roof.bar}"
                  puts "IG_Rating: #{random_roof.ig_rating}/5"
                  puts "Would your like to book this rooftop?"
                  choice = prompt.select("",["YES", "Back"])
                    if choice == "YES"
                      puts "Please enter the party size"
                      booking_party_size = gets.chomp
                      puts "Please enter the date of your reservation (YY-MM-DD HH-MI)"
                      booking_date = gets.chomp
                      puts "Thank you for using RoofHopper, We are generating your reservation"
                      puts "⏳⏳⏳⏳⏳"
                      sleep(2)
                      roof_id= Roof.find_by(name: random_roof.name).id
                      # binding.pry
                      $user.bookings.create(roof_id: roof_id,  date_time: booking_date, party_size: booking_party_size)
                      puts "Your reservation has been made and added to your profile"
                      sleep(1.5)
                      home_page
                    # elsif choice == "NO, Show Me Another Rooftop"
                    elsif choice == "Back"
                      self.home_page
                      sleep(1.5)
                    end
                  

                ##########################################
              elsif choice == "Back"
                self.home_page
              end
                ##########################################

                ##########################################
            elsif choice == "Quit"
              sleep(1)
              puts "Have a nice day #{$user.name}"
              sleep(1)
              exit
            end
          end













end
