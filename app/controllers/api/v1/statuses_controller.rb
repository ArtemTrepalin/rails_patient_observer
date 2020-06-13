class Api::V1::StatusesController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create

  def index
    @statuses = Status.all
    render json: @statuses, status: :ok
  end
end
