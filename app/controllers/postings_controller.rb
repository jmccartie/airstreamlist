class PostingsController < ApplicationController
  before_action :set_posting, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  # GET /postings
  def index
    @postings = Posting.includes(:user).order("created_at DESC").paginate(:page => params[:page])
  end

  # GET /postings/1
  def show
    @posting = Posting.find(params[:id])
  end

  # GET /postings/new
  def new
    @posting = Posting.new
  end

  # GET /postings/1/edit
  def edit
  end

  # POST /postings
  def create
    @posting = current_user.postings.new(posting_params)

    if @posting.save
      redirect_to @posting, notice: 'Posting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /postings/1
  def update
    if @posting.update(posting_params)
      redirect_to @posting, notice: 'Posting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /postings/1
  def destroy
    @posting.destroy
    redirect_to postings_url, notice: 'Posting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @posting = current_user.postings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def posting_params
      params.require(:posting).permit(:title, :description, :model, :year, :length, :kind, :zip_code, photos: [])
    end
end
