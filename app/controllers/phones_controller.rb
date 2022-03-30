class PhonesController < ApplicationController
  before_action :set_contact

  def destroy
    phone = Phone.find(phone_params[:id])
    phone.destroy
  end

  def create
    @contact.phones << Phone.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    phone = Phone.find(phone_params[:id])

    if phone.update(phone_params)
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @contact.phones
  end

  private
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    def phone_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
