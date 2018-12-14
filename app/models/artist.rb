class Artist < ApplicationRecord
  belongs_to :user
  has_many :paintings, dependent: :destroy
  validates :name, presence: true
  validates :bio, presence: true, uniqueness: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  multisearchable :against => [:name, :bio]
end
