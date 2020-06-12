
class Api::V1::WatchersController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def index
    @users = Watcher.all
    render json: @users, status: :ok
  end

  def show
    render json: @watcher, status: :ok
  end

  def create
    @watcher = Watcher.new(watcher_params)
    if @watcher.save
      render json: @watcher, status: :created
    else
      render json: { errors: @watcher.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @watcher.update(watcher_params)
      render json: { errors: @watcher.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @watcher.destroy
  end

  private

  def find_user
    @watcher = Watcher.find_by(email: params[:email])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'watcher not found' }, status: :not_found
  end

  def watcher_params
    params.permit(
      :first_name, :last_name, :sur_name, :email, :password, :phone_number
    )
  end
end