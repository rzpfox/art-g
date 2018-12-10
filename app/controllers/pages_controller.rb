class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @featured_paintings = Painting.where(featured: true).order("RANDOM()").limit(6)
    @other_paintings = Painting.where(featured: false).order("RANDOM()").limit(12)
  end
end
