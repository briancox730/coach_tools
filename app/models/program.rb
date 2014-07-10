class Program < ActiveRecord::Base
  has_many :users
  has_many :wods
  has_many :workouts, through: :wods
  has_many :statistics, through: :workouts
end
