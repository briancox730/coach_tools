class User < ActiveRecord::Base
  has_many :statistics
  belongs_to :program
  has_one :personal_record

  after_create :create_pr

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_pr
    PersonalRecord.create(user_id: self.id)
  end
end
