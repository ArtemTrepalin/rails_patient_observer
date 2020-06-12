class Web::Admin::CategoriesController < Web::Admin::ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_attrs)
    if @category.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    redirect_to action: :index
  end

  private

  def category_attrs
    params.require(:category).permit(:name, :image_link)
  end
end
