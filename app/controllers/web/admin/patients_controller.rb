class Web::Admin::PatientsController < Web::Admin::ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_attrs)
    if @patient.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def patient_attrs
    params.require(:patient).permit(:first_name, :last_name, :sur_name, :phone_number, :address, :sickness,
                                    :height, :weight, :watcher_id)
  end
end
