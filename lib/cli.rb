# frozen_string_literal: true

require 'pry'
class CommandLineInterface
  def ruby_clear
    system 'clear'
  end

  def signing_options
    prompt = TTY::Prompt.new
    choice = prompt.select('Welcome to RoofHopper', ['Log In', 'Sign Up'], active_color: :cyan)
    ruby_clear
    if choice == 'Sign Up'
      puts 'Please Enter Your Name'
      user_name = gets.chomp
      puts 'Please Enter Your Email'
      user_email = gets.chomp
      new_user = User.create(name: user_name.to_s, email: user_email.to_s)
      signing_options
    # #something about moving to a different method without the new user
    elsif choice == 'Log In'
      # login_email = prompt.ask('What is your email?')
      puts 'Please Enter Your Email'
      login_email = gets.chomp
      $user = User.find_by(email: login_email.to_s)
      # binding.pry
      # if login_email != nil
      if !$user.nil? && login_email == $user.email
        sleep(1)
        ruby_clear
        puts "Welcome Back #{$user.name}"
        sleep(1)
      elsif $user.nil?
        puts 'Wrong email, please re-enter your email'
        sleep(1)
        signing_options
      end
    end
  end

  def home_page
    prompt = TTY::Prompt.new
    choice = prompt.select('', ['View Profile', 'Book A Roof', 'Quit'], active_color: :cyan)
  ##########################################
    if choice == 'View Profile'
      choice = prompt.select('', ['Your Reservations', 'Update Booking', 'Cancel Booking', 'Back'],active_color: :cyan)
      ruby_clear
    ##########################################
      if choice == 'Your Reservations'
        if $user.bookings != []
          puts 'Here Are Your Reservations'
          puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
          $user.bookings.map do |booking|
            puts "Roof Name: #{booking.roof.name} "
          puts "Date: #{booking.date_time} "
          puts "Party Size: #{booking.party_size} "
          puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
          end
          home_page
        ##########################################
        else
          puts 'You have no reservations'
          sleep(1.5)
          home_page
        end
    ##########################################
      elsif choice == 'Update Booking'
        choice = prompt.select('', ['By Time', 'By Party Size', 'Back'], active_color: :cyan)
        ##########################################
        if choice == 'By Time'
          if $user.bookings != []
            puts 'Here Are Your Reservations'
            puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
            $user.bookings.map do |booking|
              puts "Roof Name: #{booking.roof.name} "
            puts "Date: #{booking.date_time} "
            puts "Party Size: #{booking.party_size} "
            puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
            puts 'Would you like to update this reservation?'
            choice = prompt.select('', %w[YES NO],active_color: :cyan)
            next unless choice == 'YES'

            puts 'What is the new date? (YYYY-MM-DD HH-MI)'
            user_input = gets.chomp
            booking.update(date_time: user_input)
            puts 'Updating reservation'
            sleep(1)
            puts '📝Reservation Updated📝'
            end
            home_page
          else
            ruby_clear
            puts 'You have no reservations to update'
            sleep(1.5)
            home_page
          end
        ##########################################
        elsif choice == 'By Party Size'
          if $user.bookings != []
            puts 'Here Are Your Existing Reservations'
            puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
            $user.bookings.map do |booking|
              puts "Roof Name: #{booking.roof.name} "
            puts "Date: #{booking.date_time} "
            puts "Party Size: #{booking.party_size} "
            puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
            puts 'Would you like to update this reservation?'
            choice = prompt.select('', %w[YES NO],active_color: :cyan)
            next unless choice == 'YES'

            puts 'What is your new party size?'
            user_input = gets.chomp
            booking.update(party_size: user_input)
            puts 'Updating reservation'
            sleep(1)
            puts '📝Reservation Updated📝'
            end
            home_page
          else
            puts 'You have no reservations to update'
            sleep(1.5)
            home_page
          end
        ########################################
        elsif choice == 'Back'
        home_page
        end
    ##########################################
      elsif choice == 'Cancel Booking'
        if $user.bookings != []
          puts 'Here Are Your Existing Reservations'
          puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
          $user.bookings.map do |booking|
            puts "Roof Name: #{booking.roof.name} "
          puts "Date: #{booking.date_time} "
          puts "Party Size: #{booking.party_size} "
          puts '🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟🎟'
          puts 'Would you like to delete this reservation?'
          # puts "Please type in the reservation you would like to cancel"
          choice = prompt.select('', %w[YES NO])
          next unless choice == 'YES'

          puts 'Are you sure about that?!'
          choice = prompt.select('', %w[YES NO])
          next unless choice == 'YES'

          booking.delete
          $user.bookings.reload
          puts 'Deleting this reservation'
          puts '❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌'

          sleep(1.5)
          end
          ruby_clear
          home_page
        else
          puts 'You have no reservations to cancel'
          sleep(1.5)
          home_page
        end
    ########################################ß
      elsif choice == 'Back'
        home_page
      end
  ##########################################
    elsif choice == 'Book A Roof'
      ruby_clear
      puts 'Conduct Your Own Search Or Let Us Pick For You'
      choice = prompt.select('', ['Rooftop Search', 'Random Rooftop', 'Back'], active_color: :cyan)
      if choice == 'Rooftop Search'
        # puts 'How would you like to use the roof?'
        ##########################################
            choices = [
              { name: 'Casual Dress Code', value: { dress_code: 'Casual' } },
              { name: 'Business Casual Dress Code', value: { dress_code: 'Business Casual' } },
              { name: 'Semi-Casual Dress Code', value: { dress_code: 'Semi Casual' } },
              { name: 'Casual Dressy Dress Code', value: { dress_code: 'Casual Dressy' } },
              { name: 'Manhattan', value: { location: 'Manhattan' } },
              { name: 'Brooklyn', value: { location: 'Brooklyn' } },
              { name: 'With Entertainment', value: { entertainment: 'Yes' } },
              { name: 'Without Entertainment', value: { entertainment: 'No' } },
              { name: 'Allows Dogs', value: { dog: 'Yes' } },
              { name: 'No Dogs Allowed', value: { dog: 'No' } },
              { name: 'Food Menu', value: { food: 'Yes' } },
              { name: 'No Food Menu', value: { food: 'No' } },
              { name: 'Full Bar', value: { bar: 'Yes' } },
              { name: 'No Bar', value: { bar: 'No' } },
              { name: 'Cheap', value: { price_range: '< 3' } },
              { name: 'Expensive', value: { price_range: '=> 3' } },
              { name: 'Instagramable View', value: { ig_rating: '> 3' } }
            ]
            ruby_clear
            filter_selection = prompt.multi_select('Customize Your Roof', choices, filter: true)
            # binding.pry
            if filter_selection == []
              puts "Whoopsies, you forgot to make a selection."
              home_page
            elsif filter_selection[0][:price_range] == '=> 3'
              filtered_output = Roof.where(:price_range => [3,4,5])
            elsif filter_selection[0][:price_range] == '< 3'
              filtered_output = Roof.where(:price_range => [1,2])
            elsif filter_selection[0][:ig_rating] == '=> 3'
              filtered_output = Roof.where(:ig_rating => [3,4,5])
            else
              filtered_output = Roof.where(filter_selection[0])
            end

            filter_selection[1..-1].each do |selection|
              if selection.keys.include?(:price_range)
                filtered_output = filtered_output.where(:price_range => [1,2]) if selection[:price_range] == '< 3'
                filtered_output = filtered_output.where(:price_range => [3,4,5]) if selection[:price_range] == '=> 3'
                filtered_output = filtered_output.where(:price_range => [3,4,5]) if selection[:ig_rating] == '=> 3'
              else
                filtered_output = filtered_output.where(selection)
              end
            end
              # binding.pry
              filtered_roof = filtered_output.map {|roof| roof}
              # binding.pry
              if filtered_output == []
              puts "We Don't Have a Rooftop That Matches This Criteria 😬"
              ruby_clear
              home_page
              else
              filtered_roof.each do |roof|
                puts "Name: #{roof.name}"
                puts "Dress code: #{roof.dress_code}"
                puts "Price range: #{roof.price_range}/5"
                puts "Location: #{roof.location}"
                puts "Entertainment: #{roof.entertainment}"
                puts "Dog: #{roof.dog}"
                puts "Food: #{roof.food}"
                puts "Bar: #{roof.bar}"
                puts "IG Rating: #{roof.ig_rating}/5"
                puts '🌆🌆🌆🌆🌆🌆🌆🌆🌆🌆'
                sleep(0.75)
              end
              puts "Would You Like To Book This Roof?"
              choice = prompt.select('', %w[YES NO],active_color: :cyan)
              if choice == 'YES'
              puts 'Please enter the name of your desired roof'
              booking_name = gets.chomp
              puts 'Please enter the party size'
              booking_party_size = gets.chomp
              puts 'Please enter the date of your reservation (YY-MM-DD HH-MI)'
              booking_date = gets.chomp
              puts 'Thank you for using RoofHopper, We are generating your reservation'
              puts '⏳⏳⏳⏳⏳'
              sleep(2)
                # binding.pry
              roof_id = Roof.find_by(name: booking_name).id
              $user.bookings.create(roof_id: roof_id,  date_time: booking_date, party_size: booking_party_size)
              puts 'Your reservation has been made and added to your profile'
              sleep(1.5)
              home_page
              else home_page
              end
              end
        ##########################################
      elsif choice == 'Random Rooftop'
          puts "Here's Our Recommendation"
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
          puts 'Would You Like to Book This Rooftop?'
          choice = prompt.select('', %w[YES Back], active_color: :cyan)
          if choice == 'YES'
            puts 'Please Enter Your Party Size'
            booking_party_size = gets.chomp
            puts 'Please Enter The Date of Your Reservation (YY-MM-DD HH-MI)'
            booking_date = gets.chomp
            puts 'Thank You For Using RoofHopper, We Are Generating Your Reservation'
            puts '⏳⏳⏳⏳⏳'
            sleep(2)
            roof_id = Roof.find_by(name: random_roof.name).id
            # binding.pry
            $user.bookings.create(roof_id: roof_id,  date_time: booking_date, party_size: booking_party_size)
            puts 'Your Reservation Has Been Made and Added to Your Profile'
            sleep(1.5)
            home_page
          elsif choice == 'Back'
            ruby_clear
              home_page
              sleep(1.5)
          end
          # elsif choice == "NO, Show Me Another Rooftop"
      elsif choice == 'Back'
            home_page
            sleep(1.5)
        end
  ##########################################
    elsif choice == 'Quit'
      sleep(1)
      puts "Have a Great Day #{$user.name}!"
      ruby_clear
      sleep(1)
      exit
    end
  end
end
