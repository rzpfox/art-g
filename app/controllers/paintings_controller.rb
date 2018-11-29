class PaintingsController < ApplicationController
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
    @painting.save

    redirect_to @painting
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @painting = painting.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @painting = painting.find(params[:id])
    @painting.update(painting_params)
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @painting = painting.find(params[:id])
    @painting.destroy(painting_params)
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :description, :artist_name, :status, :value, :gallery_id, :painting_id, :photo)
  end
end
