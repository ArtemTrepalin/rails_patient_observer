class Api::V1::Watchers::Patients::DietsController < Api::V1::Watchers::Patients::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_diet, except: %i[create index]

  def index
    @diets = Diet.where(:patient_id => params['patient_id'])
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
  def find_diet
    @diet = Diet.find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'diet not found' }, status: :not_found
  end


  def diet_params
    params.permit(
      :description, :patient_id, :title
    )
  end
end
