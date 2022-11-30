class Api::V1::ShowsController < Api::V1::BaseController
  def index
    if params[:query]
      sql_query = <<~SQL
        name ILIKE :query
        OR description ILIKE :query
        OR address ILIKE :query
        OR comedian ILIKE :query
      SQL
      @shows = Show.where(sql_query, query: "%#{params[:query]}%")
    else
      @shows = Show.all
    end

    render json: { shows: @shows }
  end

  def show
    @show = Show.find(params[:id])
    render json: { show: @show }
  end

  def create
    @show = Show.new(show_params)
    @show.user = User.find(params[:user_id])

    if @show.save
      render json: { show: @show }
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  private

  def show_params
    params.require(:show).permit(:name, :description, :poster_url, :address, :time, :comedian)
  end
end
