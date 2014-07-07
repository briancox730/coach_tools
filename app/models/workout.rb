class Workout < ActiveRecord::Base
  has_many :statistics
  has_one :wtype

end
