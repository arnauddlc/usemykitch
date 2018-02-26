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
    if @booking.valid?
      
    else
      render 'kitchens/show'
    end
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    if @booking.save
      redirect_to show_dashboard_path
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    if @booking.save
      redirect_to show_dashboard_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def calculate_total_price
    (@booking.end_date - @booking.start_date) * @kitchen.price
  end
end
