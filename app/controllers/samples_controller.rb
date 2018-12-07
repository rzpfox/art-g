class SamplesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :all]

  before_action :locate_exhibition, only: [:new, :create]

  before_action :locate_existing_artists, only: [:new, :edit]

  before_action :locate_sample, only: [:edit, :update, :destroy]

  def index
    # @samples = sample.all
    @samples = policy_scope(Sample).order("RANDOM()")
  end

  def all
    @samples = Sample.all.order("RANDOM()")
    authorize @samples, :all?
  end

  def show
    @sample = Sample.find(params[:id])
    @exhibition = @sample.exhibition
    authorize @sample
  end

  def new
    redirect_to new_artist_path if Artist.all == []

    @sample = Sample.new
    # @sample.user = @exhibition.user

    authorize @exhibition
  end

  def create
    @sample = Sample.new(processed_params)

    @sample.exhibition = @exhibition
    @sample.user = current_user

    authorize @sample

    @sample.save!
    redirect_to exhibition_path(@exhibition)
  end

  def edit
    authorize @sample
  end

  def update
    authorize @sample
    @sample.update(sample_params)
    # @sample.exhibition = @exhibition
    redirect_to @sample
  end

  def destroy
    authorize @sample
    @sample.destroy
    redirect_to exhibition_path(@sample.exhibition)
  end

  private

  def sample_params
    params.require(:sample).permit(:title, :user_id, :description, :featured, :artist_id, :status, :value, :photo)
  end

  def processed_params
    data = sample_params
    data[:artist_id] = data[:artist_id].to_i
    data
    # {
    #   title: sample_params[:title],
    #   user_id: sample_params[:user_id],
    #   description: sample_params[:description],
    #   artist_id: sample_params[:artist_id].to_i,
    #   status: sample_params[:status],
    #   value: sample_params[:value],
    #   photo: sample_params[:photo]
    # }
  end

  def locate_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end

  def locate_existing_artists
    @existing_artists = Artist.all
  end

  def locate_sample
    @sample = Sample.find(params[:id])
  end
end
