class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @exhibitions = Exhibition.all
    @exhibitions = policy_scope(Exhibition).order(created_at: :asc)
  end

  def all
    @exhibitions = Exhibition.all.order(created_at: :asc)
    authorize @exhibitions, :all?
  end

  def show
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end

  def new
    @exhibition = Exhibition.new
    authorize @exhibition
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.user = current_user
    authorize @exhibition
    @exhibition.save!

    redirect_to @exhibition
  end

  def edit
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end

  def update
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
    @exhibition.update(exhibition_params)
    redirect_to @exhibition
  end

  def destroy
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
    @exhibition.destroy
    redirect_to root_path
  end

  private

  def exhibition_params
    params.require(:exhibition).permit(:title, :user_id, :location, :dates, :description, :sample_id, :gallery_id, :photo)
  end
end
