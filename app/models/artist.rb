class Artist < ApplicationRecord
  belongs_to :user
  has_many :paintings, dependent: :destroy
  validates :name, presence: true
  validates :bio, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
