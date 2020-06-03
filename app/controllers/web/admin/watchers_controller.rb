class Web::Admin::WatchersController < Web::Admin::ApplicationController
  def index
    @watchers = Watcher.all
  end

  def new
    @watcher = Watcher.new
  end

  def create
    @watcher = Watcher.new(watcher_attrs)
    if @watcher.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @watcher = Watcher.find(params[:id])
  end

  def edit
    @watcher = Watcher.find(params[:id])
  end

  def update
    @watcher = Watcher.find(params[:id])
    if @watcher.update(watcher_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def watcher_attrs
    params.require(:watcher).permit(:first_name, :last_name, :sur_name, :email, :phone_number, :password)
  end
end
