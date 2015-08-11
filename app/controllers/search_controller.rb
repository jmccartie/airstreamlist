class SearchController < ApplicationController

  # TODO
  def index
    # @search = Listing.search(params[:q])
    @search = Search.new(params)
  end
end
