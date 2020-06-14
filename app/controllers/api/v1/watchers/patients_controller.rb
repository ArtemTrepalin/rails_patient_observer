
class Api::V1::Watchers::PatientsController < Api::V1::Watchers::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_patient, except: %i[create index]

  def index
    @patients = Patient.where(:watcher_id => params['watcher_id'])
    render json: @patients, status: :ok
  end

  def show
    if params[:password]
      @patient[:sickness] = AESCrypt.decrypt(@patient[:sickness], params[:password])
    end
    render json: @patient, status: :ok
  end

  def create
    @patient = Patient.new(patient_params)
    @patient[:sickness] = AESCrypt.encrypt(patient_params[:sickness], patient_params[:password])
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
    @patient = Patient.find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'patient not found' }, status: :not_found
  end

  def patient_params
    params.permit(
      :first_name, :last_name, :sur_name, :password, :email, :phone_number, :birthday, :address, :sickness, :height, :weith, :watcher_id
    )
  end
end