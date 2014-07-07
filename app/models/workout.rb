class Workout < ActiveRecord::Base
  has_many :statistics
  belongs_to :wtype

end
