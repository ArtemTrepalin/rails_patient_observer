class Web::Admin::StreetsController < Web::Admin::ApplicationController
  def index
    @streets = Street.all
  end

  def new
    @street = Street.new
  end

  def create
    @street = Street.new(street_attrs)
    if @street.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @street = Street.find(params[:id])
  end

  def edit
    @street = Street.find(params[:id])
  end

  def update
    @street = Street.find(params[:id])
    if @street.update(street_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    street = Street.find(params[:id])
    street.destroy

    redirect_to action: :index
  end

  private

  def street_attrs
    params.require(:street).permit(:name, building_ids: [])
  end
end
