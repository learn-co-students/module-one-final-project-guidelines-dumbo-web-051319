def ruby_clear
 system "clear" or system "cls"
end

def list_input_prompt
  splash
  prompt = TTY::Prompt.new
  input = prompt.select("Welcome!".center(65), ["Login".center(60), "Create User".center(60)])
  puts 7.chr
  input = input.strip
  login_input_selector(input)
end

def login_input_selector(input)
  case input
  when "Login"
    ruby_clear
    login
  when "Create User"
    ruby_clear
    create_user
  end
end

def login
  r = []
  font = TTY::Font.new(:standard)
  prompt = TTY::Prompt.new
  pastel = Pastel.new
  spinner
  puts pastel.green(font.write("LOGIN"))
  user_name = prompt.ask('username:')

  ruby_clear
  puts 7.chr
  if user_name != nil
    User.all.collect{|u| r << u if u.name == user_name}
    p = r.pop
    if p != nil && p.name == user_name
      puts 7.chr
      spinner
      puts pastel.green(font.write("PASSWORD"))
      pw = prompt.mask("password:")
      puts 7.chr
      ruby_clear
      if pw != nil && p.name == user_name
        if pw == p.password
          spinner
          puts "Success!"
          puts "Welcome #{p.name}"
          p
        else
          puts pastel.red(font.write("TRY AGAIN!"))
          get_pause
          login
        end
      else
        puts pastel.red(font.write("TRY AGAIN!"))
        get_pause
        login
      end
    else
      puts pastel.red(font.write("TRY AGAIN!"))
      get_pause
      login
    end
  else
    puts pastel.red(font.write("TRY AGAIN!"))
    get_pause
    login
  end
end

def create_user
  prompt = TTY::Prompt.new
  user_name = prompt.ask("Enter you username:")
  user_pw = prompt.mask("Password")
  user = User.create(name: user_name, password: user_pw)
  puts "Great work #{user_pw}!!"
  spinner
  login
end
