class GalleriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.save

    redirect_to @gallery
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update(gallery_params)
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy(gallery_params)
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :address, :contact_name, :painting_id, :gallery_id, :phone_number, :photo)
  end
end
