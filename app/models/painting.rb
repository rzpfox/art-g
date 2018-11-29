class Painting < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :artist_name, presence: true
  validates :status, presence: true
  validates :value, presence: true
  belongs_to :gallery
end
