class SearchController < ApplicationController

  # TODO
  def index
    # @search = Posting.search(params[:q])
    @search = Search.new(params)
  end
end
