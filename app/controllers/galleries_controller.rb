class GalleriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @galleries = Gallery.all
    @galleries = policy_scope(Gallery).order(created_at: :asc)
  end

  def all
    @galleries = Gallery.all.order(created_at: :asc)
    authorize @galleries, :all?
  end

  def show
    @gallery = Gallery.find(params[:id])
    authorize @gallery
    @marker = { lng: @gallery.longitude, lat: @gallery.latitude }
  end

  def new
    @gallery = Gallery.new
    authorize @gallery
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user = current_user
    authorize @gallery
    @gallery.save!

    redirect_to @gallery
  end

  def edit
    @gallery = Gallery.find(params[:id])
    authorize @gallery
  end

  def update
    @gallery = Gallery.find(params[:id])
    authorize @gallery
    @gallery.update(gallery_params)
    redirect_to @gallery
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    authorize @gallery
    @gallery.destroy
    redirect_to root_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :user_id, :address, :contact_name, :painting_id, :gallery_id, :phone_number, :photo)
  end
end
