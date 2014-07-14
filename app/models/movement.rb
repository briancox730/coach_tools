class Movement < ActiveRecord::Base
  has_many :workouts

  validates_uniqueness_of :name
end
