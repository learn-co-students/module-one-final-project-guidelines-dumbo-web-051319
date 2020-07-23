class Fortune < ActiveRecord::Base
  has_many :diaries
  has_many :users, through: :diaries

  def self.random
    Fortune.all.sample.quote
  end

  def user_names
    self.users.map {|user| user.name}
  end

  def self.love
    Fortune.all.select{|fortune| fortune.fortune_type == "love"}
  end

  def self.wealth
    Fortune.all.select{|fortune| fortune.fortune_type == "wealth"}
  end

  def self.career
    Fortune.all.select {|fortune| fortune.fortune_type == "career"}
  end

end
