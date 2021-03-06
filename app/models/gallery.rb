class Gallery < ApplicationRecord
  belongs_to :user
  has_many :paintings, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :contact_name, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  include PgSearch
  multisearchable :against => [:name, :address]
end
