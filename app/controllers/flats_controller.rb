class FlatsController < ApplicationController

  def index
    @flats = policy_scope(Flat)
    @flats = Flat.all
    @flats_count = Flat.count
    # @random_images = @flats.map do |flat|
    #   Unsplash::Photo.random(query: "hotel room").urls.small
    # end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    authorize @flat #Pundit authorization
  end

  def new
    @flat = Flat.new
    authorize @flat #Pundit authorization
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat #Pundit authorization
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    authorize @flat #Pundit authorization
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat #Pundit authorization
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
