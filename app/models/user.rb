class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :galleries
  has_many :artists

  # using has_many with through: is indirect reference,
  # this way would not retain painting when gallery is destroyed
  has_many :paintings, through: :galleries
  has_many :appointments, through: :galleries

  enum role: [:user, :owner]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
