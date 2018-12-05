class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @featured_paintings = Painting.where(featured: true)
    @other_paintings = Painting.where(featured: false)
  end
end
