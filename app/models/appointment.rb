class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :gallery

  validates :visitor_name, :visitor_email, :start_time, presence: true

end
