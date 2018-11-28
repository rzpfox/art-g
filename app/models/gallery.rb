class Gallery < ApplicationRecord
  has_many :paintings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
