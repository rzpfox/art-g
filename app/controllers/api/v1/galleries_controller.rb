class Api::V1::GalleriesController < Api::V1::BaseController
  before_action :find_gallery, only: :show

  def index
    @galleries = Gallery.all
    # render json: @galleries
  end

  def show
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description, :address, :phone_number, :photo)
  end

  def render_error
    render json: { errors: @gallery.errors.full_messages }, status: :unprocessable_entity
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
    # NOT SURE WHY I NEED TO REMOVE THE LINE BELOW, PLEASE TELL ME
    # render json: @gallery
  end
end
