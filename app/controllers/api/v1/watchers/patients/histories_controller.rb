class Api::V1::Watchers::Patients::HistoriesController < Api::V1::Watchers::Patients::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_history, except: %i[create index]


  def index
    @histories = History.where(:patient_id => params['patient_id'])
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

  def find_history
    @history = History.find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'history not found' }, status: :not_found
  end


  def history_params
    params.permit(
      :patient_id, :status_id, :temperature, :pressure
    )
  end
end
