class SearchController < ApplicationController

  # TODO
  def index
    @search = Search.new(params)
  end
end
