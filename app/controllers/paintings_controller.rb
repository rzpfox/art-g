class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
    @gallery = @painting.gallery
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new(painting_params)
    @painting.gallery = @gallery
    if @painting.save
      redirect_to gallery_path(@gallery)
    else
      render "galleries/show"
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    @painting.update(painting_params)
    # @painting.gallery = @gallery
    redirect_to @painting
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to gallery_path(@painting.gallery)
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :description, :artist_name, :status, :value, :gallery_id, :painting_id, :photo)
  end
end
