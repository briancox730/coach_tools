class User < ActiveRecord::Base
  has_many :statistics

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
