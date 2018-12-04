class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @artists = policy_scope(Artist).order(created_at: :asc)
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist
  end

  def new
    @artist = Artist.new
    authorize @artist
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    authorize @artist
    @artist.save!

    redirect_to @artist
  end

  def edit
    @artist = Artist.find(params[:id])
    authorize @artist
  end

  def update
    @artist = Artist.find(params[:id])
    authorize @artist
    @artist.update(artist_params)
    redirect_to @artist
  end

  def destroy
    @artist = Artist.find(params[:id])
    authorize @artist
    @artist.destroy
    redirect_to root_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :user_id, :bio, :painting_id, :gallery_id, :photo)
  end
end
