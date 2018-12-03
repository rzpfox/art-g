class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # @paintings = Painting.all
    @paintings = policy_scope(Painting).order(created_at: :asc)
  end

  def show
    @painting = Painting.find(params[:id])
    @gallery = @painting.gallery
    authorize @painting
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new
    authorize @painting
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new(painting_params)
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
    @painting = Painting.find(params[:id])
    authorize @painting
  end

  def update
    @painting = Painting.find(params[:id])
    authorize @painting
    @painting.update(painting_params)
    # @painting.gallery = @gallery
    redirect_to @painting
  end

  def destroy
    @painting = Painting.find(params[:id])
    authorize @painting
    @painting.destroy
    redirect_to gallery_path(@painting.gallery)
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :user_id, :description, :artist_name, :status, :value, :gallery_id, :painting_id, :photo)
  end
end
