class Api::V1::PaintingsController < Api::V1::BaseController
  before_action :find_painting, only: :show

  def index
    @paintings = Painting.all
    # render json: @paintings
  end

  def show
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :description, :status, :gallery_id, :artist_id, :photo)
  end

  def render_error
    render json: { errors: @painting.errors.full_messages }, status: :unprocessable_entity
  end

  def find_painting
    @painting = Paiting.find(params[:id])
    # render json: @painting
  end
end
