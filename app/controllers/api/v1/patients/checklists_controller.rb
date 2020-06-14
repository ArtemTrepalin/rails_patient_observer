class Api::V1::Patients::ChecklistsController < Api::V1::Patients::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_checklist, except: %i[create index]


  def index
    @checklists = Checklist.where(:patient_id => params['patient_id'])
    render json: @checklists, status: :ok
  end

  def show
    render json: @checklist, status: :ok
  end

  def create
    @checklist = Checklist.new(checklist_params)
    if @checklist.save
      render json: @checklist, status: :created
    else
      render json: { errors: @checklist.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @checklist.update(checklist_params)
      render json: { errors: @checklist.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @checklist.destroy
  end

  private

  def find_checklist
    @checklist = Checklist.find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'checklist not found' }, status: :not_found
  end

  def checklist_params
    params.permit(
      :name, :status, :patient_id
    )
  end
end
