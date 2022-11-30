class Api::V1::BookingsController < Api::V1::BaseController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find(params[:user_id])

    if @booking.save
      render json: { booking: @booking }
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:show_id)
  end
end
