class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  # GET /listings
  def index
    @listings = Listing.includes(:user).order("created_at DESC").paginate(:page => params[:page], per_page: 10)
  end

  # GET /listings/1
  def show
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.new
  end

  # GET /listings/1/edit
  def edit
  end

  def my
    @listings = current_user.listings
  end

  # POST /listings/1/contact
  def contact
    @listing = Listing.find(params[:listing_id])
    if params[:message].present?
      UserMailer.contact(@listing.id, current_user.id, params[:message]).deliver_later
    end
    redirect_to @listing, notice: "Your message has been sent"
  end

  # POST /listings
  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      ListingMailer.created(@listing.id).deliver_later
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = current_user.listings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing)
        .permit(:title, :description, :price, :model, :year, :length, :kind, :city, :state, photos: [])
        .merge(price: params[:listing][:price].gsub(",", ""))

    end

end
