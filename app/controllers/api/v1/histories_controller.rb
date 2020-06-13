
class Api::V1::HistoriesController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create

  def index
    @histories = History.all
    render json: @histories, status: :ok
  end

  def show
    render json: @history, status: :ok
  end

  def create
    @history = History.new(history_params)
    if @history.save
      render json: @history, status: :created
    else
      render json: { errors: @history.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @history.update(history_params)
      render json: { errors: @history.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @history.destroy
  end

  private

  def history_params
    params.permit(
      :patient_id, :status_id, :temperature, :pressure
    )
  end
end