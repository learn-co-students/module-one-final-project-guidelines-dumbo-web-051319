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
                sleep(1)
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
          choice = prompt.select("",%w(ViewProfile Bookings))
          if choice == "ViewProfile"
            choice = prompt.select("",%w(Your_Reservation Update_Booking Cancel_Booking))
          if choice == "Your_Reservation"
            puts "Here are your reservations"
            $user.bookings[0].roof_id
            $user.booking[0].party_size
            binding.pry
            # $user.booking

          end











          elsif choice == "Bookings"
            # login_email = prompt.ask('What is your email?')
                puts "wat u want"
            end
          end













end
