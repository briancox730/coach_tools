class Program < ActiveRecord::Base
  has_many :users
  has_many :wods
end
