class BookingsController < ApplicationController
  before_action :set_flat, only: %i[new create]
  before_action :authenticate_user!


  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    start_date = params[:start_date]
    end_date = params[:end_date]
    # duration = (end_date - start_date).to_i
    @booking.flat = @flat
    # @booking.final_price = @flat.price * duration
    @booking.status = 0
    if @booking.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: params[:new_status])
    redirect_to '/dashboard'
  end

 private

 def set_flat
  @flat = Flat.find(params[:flat_id])
 end

  def booking_params
    params.require(:booking).permit(:flat_id, :guests_on_booking, :start_date, :end_date)
  end
end
