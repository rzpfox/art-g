class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  def show
    # PgSearch::Multisearch.rebuild(Gallery)
    # PgSearch::Multisearch.rebuild(Painting)
    # PgSearch::Multisearch.rebuild(Artist)
    @results = PgSearch.multisearch(params[:term])
    authorize @results
  end
end
