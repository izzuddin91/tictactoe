class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :usergames
  has_many :user, through: :usergames

end
