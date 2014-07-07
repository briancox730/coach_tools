class User < ActiveRecord::Base
  has_many :statistics
  belongs_to :program

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
