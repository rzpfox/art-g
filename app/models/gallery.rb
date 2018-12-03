class Gallery < ApplicationRecord
  belongs_to :user
  has_many :paintings, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :contact_name, presence: true
  mount_uploader :photo, PhotoUploader
end
