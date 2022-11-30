class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: %i[show update]

  def show
    render json: { user: @user }
  end

  def update
    @user.update(user_params)
    render json: { user: @user }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar_url)
  end
end
