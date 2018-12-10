class AppointmentMailer < ApplicationMailer
  def new_appointment_email
    @appointment = params[:appointment]

    # generate link to appointment show page with token as query
    # how to get the base url of our website?
    @url = "http://0.0.0.0:3000/appointments/#{@appointment.id}?token=#{@appointment.token}"
    mail(to: @appointment.visitor_email, subject: 'Your Upcoming Appointment')
  end
end
