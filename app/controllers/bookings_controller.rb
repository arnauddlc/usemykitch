class BookingsController < ApplicationController

  def new
    @kitchen = Kitchen.find(params[:kitchen_id])
    @booking = Booking.new
  end

  def create
    @kitchen = Kitchen.find(params[:kitchen_id])
    @booking = Booking.new(booking_params)
    @booking.kitchen = @kitchen
    @booking.user = current_user
    @booking.total_price = calculate_total_price
    if @booking.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new
    end
  end

  def approve
    @booking.status = "approved"
  end

  def decline
    @booking.status = "declined"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def calculate_total_price
    (@booking.end_date - @booking.start_date) * @kitchen.price
  end
end
