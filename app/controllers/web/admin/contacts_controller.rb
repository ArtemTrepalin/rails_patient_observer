class Web::Admin::ContactsController < Web::Admin::ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_attrs)
    if @contact.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def contact_attrs
    params.require(:contact).permit(:name, :phone_number, :patient_id)
  end
end
