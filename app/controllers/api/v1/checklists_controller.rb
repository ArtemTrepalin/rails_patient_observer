
class Api::V1::ChecklistsController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create

  def index
    @checklists = Checklist.all
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

  def checklist_params
    params.permit(
      :name, :status, :patient_id
    )
  end
end