class Web::Admin::SicknessesController < Web::Admin::ApplicationController
  def index
    @sicknesses = Sickness.all
  end

  def new
    @sickness = Sickness.new
  end

  def create
    @sickness = Sickness.new(sickness_attrs)
    if @sickness.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @sickness = Sickness.find(params[:id])
  end

  def edit
    @sickness = Sickness.find(params[:id])
  end

  def update
    @sickness = Sickness.find(params[:id])
    if @sickness.update(sickness_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    sickness = Sickness.find(params[:id])
    sickness.destroy

    redirect_to action: :index
  end

  private

  def sickness_attrs
    params.require(:sickness).permit(:name, patient_ids: [])
  end
end
