class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    @booking.status = "pending"
    @booking.paid = false
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      redirect_to service_category_path(@service.category)
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    authorize @booking
    if @booking.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to user_path(@booking.user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :paid, :service_id)
  end

 def set_booking
    @booking = Booking.find(params[:id])
  end
end
