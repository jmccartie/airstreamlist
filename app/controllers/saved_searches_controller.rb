class SavedSearchesController < ApplicationController
  before_action :require_login

  def index
    @saved_searches = current_user.saved_searches
  end

  def create
    @saved_search = current_user.saved_searches.new(saved_search_params)
    if @saved_search.save
      redirect_to :back, notice: "Search saved!"
    else
      redirect_to :back, alert: @saved_search.errors.full_messages.first
    end
  end

  def destroy
    @saved_search = current_user.saved_searches.find(params[:id])
    @saved_search.destroy
    redirect_to :back, notice: "Search removed."
  end


  private
    def saved_search_params
      params.require(:saved_search).permit(:query)
    end
end
