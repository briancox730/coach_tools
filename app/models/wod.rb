class Wod < ActiveRecord::Base
  has_many :statistics
  belongs_to :program
end
