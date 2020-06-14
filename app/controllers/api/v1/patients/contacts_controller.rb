class Api::V1::Patients::ContactsController < Api::V1::Patients::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_contact, except: %i[create index]


  def index
    @contacts = Contact.where(:patient_id => params['patient_id'])
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

  def find_contact
    @contact = Contact.find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'contact not found' }, status: :not_found
  end


  def contact_params
    params.permit(
      :name, :phone_number, :patient_id
    )
  end
end
