require 'securerandom'

class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :locate_gallery, only: [:new, :create]

  before_action :locate_appointment, only: [:show, :edit, :update, :destroy]

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

    @appointment.token = SecureRandom.uuid
    @appointment.save

    authorize @gallery

    respond_to do |format|
      if @appointment.save
        # Tell the UserMailer to send a welcome email after save
        AppointmentMailer.with(appointment: @appointment).new_appointment_email.deliver_now
        # can also use deliver_later

        format.html { redirect_to(@appointment, notice: 'Appointment was successfully created.') }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end

    # redirect_to appointment_path(@appointment)
    # the line of code above equals to:
    # redirect_to @appointment
  end

  def edit
    @gallery = @appointment.gallery
    authorize @gallery
  end

  def update
    authorize @gallery
    @appointment.update(permited_params)

    redirect_to @appointment
  end

  def destroy

  end

  private

  def locate_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def locate_appointment
    @appointment = Appointment.find(params[:id])
  end

  def permited_params
    params.require(:appointment).permit(:visitor_name, :visitor_email, :start_time, :confirmed, :token)
  end

  def processed_params
    converted_params = permited_params
    converted_params[:start_time] = DateTime.parse(converted_params[:start_time])
    converted_params[:confirmed] = false

    converted_params
  end
end
