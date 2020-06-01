class Web::Admin::AdminsController < Web::Admin::ApplicationController
  def index
    @admins = Admin.all.page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admins_attrs)
    if @admin.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admins_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def admins_attrs
    params.require(:admin).permit(:email, :password)
  end
end
