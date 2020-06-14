class Api::V1::HelpAddressesController < Api::V1::ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_help_address, except: %i[create index]


  def index
    @help_addresses = Help_address.all
    render json: @help_addresses, status: :ok
  end

  def show
    render json: @help_address, status: :ok
  end

  def create
    @help_address = Help_address.new(help_address_params)
    if @help_address.save
      render json: @help_address, status: :created
    else
      render json: { errors: @help_address.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @help_address.update(help_address_params)
      render json: { errors: @help_address.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @help_address.destroy
  end

  private
  def find_help_address
    @help_address = Help_address.find_by(patient_id: params[:patient_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'help_address not found' }, status: :not_found
  end


  def help_address_params
    params.permit(
      :name, :location, :patient_id
    )
  end
end
