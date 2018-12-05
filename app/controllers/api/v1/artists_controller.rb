class Api::V1::ArtistsController < Api::V1::BaseController
  before_action :find_artist, only: :show

  def index
    @artists = Artist.all
    # render json: @artists
  end

  def show
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio, :photo)
  end

  def render_error
    render json: { errors: @artist.errors.full_messages }, status: :unprocessable_entity
  end

  def find_artist
    @artist = Artist.find(params[:id])
    # NOT SURE WHY I NEED TO REMOVE THE LINE BELOW, PLEASE TELL ME
    # render json: @artist
  end
end
