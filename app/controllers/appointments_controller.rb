class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :locate_gallery, only: [:new, :create]

  before_action :locate_appointment, only: :show

  def index
    @appointments = policy_scope(Appointment).order(start_time: :asc)
  end

  def show
    @gallery = @appointment.gallery
    authorize @gallery
  end

  def new
    @appointment = Appointment.new
    authorize @gallery
  end

  def create
    @appointment = Appointment.new(processed_params)
    @appointment.gallery = @gallery
    @appointment.user = @gallery.user

    @appointment.save
    authorize @gallery

    redirect_to appointment_path(@appointment)
  end

  private

  def locate_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def locate_appointment
    @appointment = Appointment.find(params[:id])
  end

  def permited_params
    params.require(:appointment).permit(:visitor_name, :visitor_email, :start_time, :confirmed)
  end

  def processed_params
    converted_params = permited_params
    converted_params[:start_time] = DateTime.parse(converted_params[:start_time])
    converted_params[:confirmed] = false

    converted_params
  end
end
