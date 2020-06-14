
class Api::V1::PatientsController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_patient, except: %i[create index]

  def index
    @patients = @current_watcher.patients
    render json: @patients, status: :ok
  end

  def show
    render json: @patient, status: :ok
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: @patient, status: :created
    else
      render json: { errors: @patient.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @patient.update(patient_params)
      render json: { errors: @patient.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
  end

  private

  def find_patient
    @patient = Patient.find_by(watcher_id: params[:watcher_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'patient not found' }, status: :not_found
  end

  def patient_params
    params.permit(
      :first_name, :last_name, :sur_name, :email, :phone_number, :birthday, :address, :sickness, :height, :weith, :watcher_id
    )
  end
end