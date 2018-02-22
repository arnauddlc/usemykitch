class DashboardsController < ApplicationController
  def show
  	@user = current_user
  	@bookings_sent = Booking.where(user: @user) #the bookings I have made to other kicthens
  	@kitchens = Kitchen.where(user: @user) #the kitchens I own
  	@bookings_received = @kitchens.map { |kitchen| kitchen.bookings }.flatten
	end	
end
