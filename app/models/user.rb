class User < ActiveRecord::Base
  has_many :diaries
  has_many :fortunes, through: :diaries

  def fortune_quotes
    self.fortunes.map {|fortune| fortune.quote}.uniq
  end

  def num_fortunes
    self.fortune_quotes.count
  end

  def destroy_last
    self.fortunes.last.destroy
  end

  def love
    new_fortune = Fortune.all.sample
    puts "Does your future hold a passionate romance?...#{new_fortune.quote}"
    new_fortune.update(fortune_type: "love")
    Diary.create(user_id: self.id, fortune_id: new_fortune.id)

  end

  def wealth
    new_fortune = Fortune.all.sample
    puts "Wealth and riches are forthcoming...#{new_fortune.quote}"
    new_fortune.update(fortune_type: "wealth")
    Diary.create(user_id: self.id, fortune_id: new_fortune.id)
  end

  def career
    new_fortune = Fortune.all.sample
    puts "Yes, many have questions about their career...#{new_fortune.quote}"
    new_fortune.update(fortune_type: "career")
    Diary.create(user_id: self.id, fortune_id: new_fortune.id)
  end

  def saved_love
    self.fortunes.select {|fortune| fortune.fortune_type == "love"}
  end

  def love_quotes
    self.saved_love.map{|fortune| fortune.quote}
  end

  def saved_wealth
    self.fortunes.select {|fortune| fortune.fortune_type == "wealth"}
  end

  def wealth_quotes
    self.saved_wealth.map {|fortune| fortune.quote }
  end

  def saved_career
    self.fortunes.select {|fortune| fortune.fortune_type == "career"}
  end

  def career_quotes
    self.saved_career.map {|fortune| fortune.quote}
  end

end
