class Sample < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :artist, presence: true
  belongs_to :user
  belongs_to :exhibition
  belongs_to :artist
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  include PgSearch
  multisearchable :against => [:title, :description]
end
