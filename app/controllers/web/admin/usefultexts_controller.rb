class Web::Admin::UsefultextsController < Web::Admin::ApplicationController
  def index
    @usefultexts = UsefulText.all
  end

  def new
    @usefultext = UsefulText.new
  end

  def create
    @usefultext = UsefulText.new(usefultexts_attrs)
    if @usefultext.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @usefultext = UsefulText.find(params[:id])
  end

  def edit
    @usefultext = UsefulText.find(params[:id])
  end

  def update
    @usefultext = UsefulText.find(params[:id])
    if @usefultext.update(usefultexts_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def usefultexts_attrs
    params.require(:usefultext).permit(:description, :category_id)
  end
end
