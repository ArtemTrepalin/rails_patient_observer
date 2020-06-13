
class Api::V1::DietsController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create

  def index
    @diets = Diet.all
    render json: @diets, status: :ok
  end

  def show
    render json: @diet, status: :ok
  end

  def create
    @diet = Diet.new(diet_params)
    if @diet.save
      render json: @diet, status: :created
    else
      render json: { errors: @diet.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @diet.update(diet_params)
      render json: { errors: @diet.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @diet.destroy
  end

  private

  def diet_params
    params.permit(
      :description, :patient_id
    )
  end
end