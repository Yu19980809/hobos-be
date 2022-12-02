class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @user = User.find(params[:user_id])
    # @bookings = Booking.where(user: @user)
    @shows = @user.shows

    render json: { shows: @shows }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find(params[:user_id])

    if @booking.save
      render json: { booking: @booking }
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    show_id = params[:show_id]
    user_id = params[:user_id]
    @booking = Booking.find_by(user_id:, show_id:)
    @booking.destroy

    render json: { data: "deleted successfully" }
  end

  private

  def booking_params
    params.require(:booking).permit(:show_id)
  end
end
