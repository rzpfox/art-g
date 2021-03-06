class Painting < ApplicationRecord
  STATUS = ["For Sale", "Not For Sale", "Pending Sale"]
  VALUE = ["High", "Medium", "Low"]
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :artist, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :value, presence: true, inclusion: { in: VALUE}
  validates :photo, presence: true

  belongs_to :user

  belongs_to :artist
  belongs_to :gallery
  mount_uploader :photo, PhotoUploader

  include PgSearch
  multisearchable :against => [:title, :description, :status]

  def featured?
    featured
  end
end
