class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :verify_request, only: [:login]

  def login
    open_id = fetch_open_id
    user =  User.find_or_create_by(open_id:)
    token = fetch_jwt_token(user)

    response.set_header('Authorization', token)
    render json: { user: }
  end

  private

  def fetch_open_id
    # 1 - Capture the code
    code = params[:code]

    # 2 - Find the app_id and app_secret in the credentials
    app_id = Rails.application.credentials.dig(:wechat, :app_id)
    app_secret = Rails.application.credentials.dig(:wechat, :app_secret)

    # 3 - Send a request to Tencent API with app_id, app_secret, and the code
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code"
    res = JSON.parse(RestClient.get(url))

    puts "-----------------------"
    puts res
    puts "-----------------------"

    res['openid']
  end

  def fetch_jwt_token(user)
    # Create a JWT with user's information
    payload = {user_id: user.id}
    JWT.encode(payload, HMAC_SECRET, 'HS256')
  end
end
