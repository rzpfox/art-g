class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :samples, dependent: :destroy
  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  include PgSearch
  multisearchable :against => [:title, :location, :description]
end
