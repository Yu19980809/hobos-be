class Api::V1::ShowsController < Api::V1::BaseController
  def index
    @shows = Show.all
    render json: { shows: @shows }
  end
end
