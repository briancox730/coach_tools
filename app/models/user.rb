class User < ActiveRecord::Base
  acts_as_token_authenticatable

  has_many :statistics
  belongs_to :program
  has_one :personal_record, dependent: :destroy

  after_create :create_pr

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_pr
    PersonalRecord.create(user_id: self.id)
  end
end
