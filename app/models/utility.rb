class Utility

  def self.login
    account_id = $prompt.ask('Account ID:', default: ENV['ACCOUNT_ID'])
    password = $prompt.mask("Password:")
    user = Account.find_by(id: account_id)
    if user == nil || user.password != password
      puts "Wrong Account ID or Password, please try again"
      login
    elsif user.password == password
      puts "Welcome back #{user.name}"
      UserUI.master(user)
    end
  end
  def self.sign_up
    name = $prompt.ask('What is your name?', default: ENV['USER'])
    password = $prompt.mask("Create password:")
    Account.create(name: name, password: password)
    new_account = Account.where("name == ?", name)[-1]
    puts "Here is you Account ID #{new_account.id}"
  end
end
#fahdflekajfdlasf
