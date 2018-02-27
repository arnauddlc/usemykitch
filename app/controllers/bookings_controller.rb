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
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def confirm_booking
    @booking = Booking.new(booking_params)
    @kitchen = Kitchen.find(params[:booking][:kitchen_id])
    @booking.kitchen = @kitchen
    @booking.user = current_user
    @booking.total_price = calculate_total_price
    @booking.save
    redirect_to kitchen_path(@booking.kitchen)
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    if @booking.save
      respond_to do |format|
        format.html {redirect_to show_dashboard_path}
        format.js { render :update }
      end
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    if @booking.save
      respond_to do |format|
        format.html {redirect_to show_dashboard_path}
        format.js { render :update }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def calculate_total_price
    (@booking.end_date - @booking.start_date) / 3_600 / 24 * @kitchen.price
  end
end
