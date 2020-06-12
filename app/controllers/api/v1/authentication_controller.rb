class Api::V1::AuthenticationController < Api::V1::ApplicationController
  before_action :authorize_request, except: :login

  def login
    @watcher = Watcher.find_by_email(params[:email])
    if @watcher&.authenticate(params[:password])
      token = JsonWebToken.encode(watcher_id: @watcher.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     first_name: @watcher.first_name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end