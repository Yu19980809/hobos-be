class Api::V1::ShowsController < ApplicationController
  def index
    @shows = Show.all
    render json: { shows: @shows }
  end
end
