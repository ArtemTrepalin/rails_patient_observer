
class Api::V1::ContactsController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create

  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def show
    render json: @contact, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @contact.update(contact_params)
      render json: { errors: @contact.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
  end

  private

  def contact_params
    params.permit(
      :name, :phone_number, :patient_id
    )
  end
end