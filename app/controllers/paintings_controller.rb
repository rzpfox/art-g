class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :all]

  before_action :locate_gallery, only: [:new, :create]

  before_action :locate_existing_artists, only: [:new, :edit]

  before_action :locate_painting, only: [:edit, :update, :destroy]

  def index
    # @paintings = Painting.all
    @paintings = policy_scope(Painting).order(created_at: :asc)
  end

  def all
    @paintings = Painting.all.order(created_at: :asc)
    authorize @paintings, :all?
  end

  def show
    @painting = Painting.find(params[:id])
    @gallery = @painting.gallery
    authorize @painting
  end

  def new
    redirect_to new_artist_path if Artist.all == []

    @painting = Painting.new
    # @painting.user = @gallery.user

    authorize @gallery
  end

  def create
    @painting = Painting.new(processed_params)

    @painting.gallery = @gallery
    @painting.user = current_user

    authorize @painting

    @painting.save!
    redirect_to gallery_path(@gallery)
    # else
    #   render "galleries/show"
    # end
  end

  def edit
    authorize @painting
  end

  def update
    authorize @painting
    @painting.update(painting_params)
    # @painting.gallery = @gallery
    redirect_to @painting
  end

  def destroy
    authorize @painting
    @painting.destroy
    redirect_to gallery_path(@painting.gallery)
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :user_id, :description, :featured, :artist_id, :status, :value, :photo)
  end

  def processed_params
    data = painting_params
    data[:artist_id] = data[:artist_id].to_i
    data
    # {
    #   title: painting_params[:title],
    #   user_id: painting_params[:user_id],
    #   description: painting_params[:description],
    #   artist_id: painting_params[:artist_id].to_i,
    #   status: painting_params[:status],
    #   value: painting_params[:value],
    #   photo: painting_params[:photo]
    # }
  end

  def locate_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def locate_existing_artists
    @existing_artists = Artist.all
  end

  def locate_painting
    @painting = Painting.find(params[:id])
  end
end
