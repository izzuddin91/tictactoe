class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :usergames
  has_many :games, through: :usergames

  def self.authenticate(username, password)
     account = self.find_by(name: username)
     if account.password == password
       account
     else
        false
     end
  end

end
