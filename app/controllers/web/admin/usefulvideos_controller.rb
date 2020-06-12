class Web::Admin::UsefulvideosController < Web::Admin::ApplicationController
  def index
    @usefulvideos = UsefulVideo.all
  end

  def new
    @usefulvideo = UsefulVideo.new
  end

  def create
    @usefulvideo = UsefulVideo.new(usefulvideos_attrs)
    if @usefulvideo.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @usefulvideo = UsefulVideo.find(params[:id])
  end

  def edit
    @usefulvideo = UsefulVideo.find(params[:id])
  end

  def update
    @usefulvideo = UsefulVideo.find(params[:id])
    if @usefulvideo.update(usefulvideos_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def usefulvideos_attrs
    params.require(:usefulvideo).permit(:description, :link, :category_id)
  end
end
