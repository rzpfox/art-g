# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  def new_appointment_email
    AppointmentMailer.with(appointment: Appointment.first).new_appointment_email
  end
end
