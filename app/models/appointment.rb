class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :gallery

  validates :visitor_name, :visitor_email, :start_time, :token, presence: true
  include PgSearch
  multisearchable :against => [:visitor_email]
end
