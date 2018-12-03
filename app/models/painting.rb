class Painting < ApplicationRecord
  STATUS = ["For Sale", "Not For Sale", "Pending Sale"]
  VALUE = ["High", "Medium", "Low"]
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :artist_name, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :value, presence: true, inclusion: { in: VALUE}
  belongs_to :user
  belongs_to :gallery
  mount_uploader :photo, PhotoUploader
end
