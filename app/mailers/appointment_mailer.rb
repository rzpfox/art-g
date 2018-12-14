class AppointmentMailer < ApplicationMailer
  def new_appointment_email
    @appointment = params[:appointment]

    p ENV['GMAIL-USERNAME']
    p ENV['GMAIL-PASSWORD']

    # generate link to appointment show page with token as query
    # how to get the base url of our website?
    @url = "https://pentimentoartg.herokuapp.com/appointments/#{@appointment.id}?token=#{@appointment.token}"
    mail(to: @appointment.visitor_email, subject: 'Your Upcoming Appointment')
  end
end
