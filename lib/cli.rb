require 'pry'
class CommandLineInterface

      def signing_options
          prompt = TTY::Prompt.new
          choice = prompt.select("Welcome to RoofHopper", %w(LogIn SignUp))
          if choice == "SignUp"
                puts "Please enter your name"
                user_name = gets.chomp
                puts "Please enter your email"
                user_email = gets.chomp
                new_user = User.create(name: "#{user_name}", email: "#{user_email}" )
          elsif choice == "LogIn"
            # login_email = prompt.ask('What is your email?')
                puts "Please enter your email"
                login_email = gets.chomp
                $user = User.find_by(email: "#{login_email}")
                # binding.pry
                  # if login_email != nil
              if $user != nil && login_email == $user.email
                puts "Welcome back #{$user.name}"
              elsif $user == nil
                puts "Wrong email, please reenter your email"
                self.signing_options
              end
            end
          end

      def home_page
          prompt = TTY::Prompt.new
          choice = prompt.select("",%w(ViewProfile Bookings),active_color: :cyan)
          if choice == "ViewProfile"
              choice = prompt.select("",%w(Your_Reservation Update_Booking Cancel_Booking Back ))
              if choice == "Your_Reservation"
                if $user.bookings != []
                puts "Here are your reservations"
                puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                $user.bookings.map do |booking|
                puts "Roof Name: #{booking.roof.name} "
                puts "Date: #{booking.date_time} "
                puts "Party Size: #{booking.party_size} "
                puts  "🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟"
                end

                else
                puts "You have no reservations"
                end
              end

              if choice == "Update_Booking"
                choice = prompt.select("",%w(ByTime ByPartySize))
                if choice == "ByTime"
                  puts "Updating reservation "
                elsif choice == "ByPartySize"
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
                      puts "What is your new party size"
                      user_input = gets.chomp
                      booking.update(party_size: user_input)
                      puts "Updating reservation"
                      sleep(1)
                    end
                  end
                end
              end

              if choice == "Cancel_Booking"
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
                puts "Deleting this reservation"
                puts "❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌"
                booking.delete
                    end
                  end
                end
                else
                puts "You have no reservations to cancel"
              end
            elsif choice == "Back"
              self.home_page
              end



          elsif choice == "Bookings"
              puts "How would you like to book your roof"
              choice = prompt.select("",%w(Book_By_Location Book_By_Features Back))
              if choice == "Book_By_Location"
                choice = prompt.select("",%w(Manhattan Brooklyn Back))
                if choice == "Manhattan"
                    puts "🌆🌆🌆🌆🌆🌆🌆🌆🌆🌆"
                  manhattan_roofs= Roof.all.select {|roof|roof.location == "Manhattan" }
                  manhattan_roofs.each do |roof|
                    puts "Name: #{roof.name}"
                    puts "Dress code: #{roof.dress_code}"
                    puts "Price range: #{roof.price_range}/5"
                    puts "Location: #{roof.location}"
                    puts "Entertainment: #{roof.entertainment}"
                    puts "Chillable: #{roof.chill}"
                    puts "Dog: #{roof.dog}"
                    puts "Food: #{roof.food}"
                    puts "Happy hour: #{roof.happy_hour}"
                    puts "IG_Rating: #{roof.ig_rating}/5"
                    puts "🌆🌆🌆🌆🌆🌆🌆🌆🌆🌆"
                    sleep(0.75)
                  end
                    puts "Please enter the name of your desired roof"
                    user_input = gets.chomp
                elsif choice == "Brooklyn"
                  puts "🌉🌉🌉🌉🌉🌉🌉🌉🌉🌉🌉"
                brooklyn_roofs= Roof.all.select {|roof|roof.location == "Brooklyn" }
                brooklyn_roofs.each do |roof|
                    puts "Name: #{roof.name}"
                    puts "Dress code: #{roof.dress_code}"
                    puts "Price range: #{roof.price_range}/5"
                    puts "Location: #{roof.location}"
                    puts "Entertainment: #{roof.entertainment}"
                    puts "Chillable: #{roof.chill}"
                    puts "Dog: #{roof.dog}"
                    puts "Food: #{roof.food}"
                    puts "Happy hour: #{roof.happy_hour}"
                    puts "IG_Rating: #{roof.ig_rating}/5"
                    puts "🌉🌉🌉🌉🌉🌉🌉🌉🌉🌉🌉"
                    sleep(0.75)
                  end
                  puts "Please enter the name of your desired roof"
                  booking_name = gets.chomp
                  puts "Please enter the party size"
                  booking_party_size = gets.chomp
                  puts "Please enter the date of your reservation"
                  booking_date = gets.chomp
                  puts "thank you for using RoofHopper, We are generating your reservation"
                  puts "⏳⏳⏳⏳⏳"
                  sleep(3)
                  binding.pry
                  Booking.create(user_id: $user.id, roof_id: booking_name.id,  date_time: booking_date, party_size: booking_party_size)
                elsif choice == "Back"
                self.home_page
                end
              elsif choice == "Book_By_Features"
              elsif choice == "Back"
                self.home_page
              end
            end
          end













end
