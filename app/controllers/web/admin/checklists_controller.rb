class Web::Admin::ChecklistsController < Web::Admin::ApplicationController
  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_attrs)
    if @checklist.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])
    if @checklist.update(checklist_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def checklist_attrs
    params.require(:checklist).permit(:name, :status, :patient_id)
  end
end
