class Web::Admin::StatusesController < Web::Admin::ApplicationController
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_attrs)
    if @status.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    status = Status.find(params[:id])
    status.destroy

    redirect_to action: :index
  end

  private

  def status_attrs
    params.require(:status).permit(:name, patient_ids: [])
  end
end
