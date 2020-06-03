class Web::Admin::BuildingsController < Web::Admin::ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_attrs)
    if @building.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.update(building_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    building = Building.find(params[:id])
    building.destroy

    redirect_to action: :index
  end

  private

  def building_attrs
    params.require(:building).permit(:position, street_ids: [])
  end
end
