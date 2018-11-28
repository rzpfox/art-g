class Painting < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  belongs_to :gallery
end
