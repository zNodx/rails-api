module V1 

class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :update, :destroy]

  include ErrorSerializer

  def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)
    
    @contacts = Contact.all.page(page_number).per(per_page)

    if stale?(etag: @contacts)
      render  json: @contacts #, methods: :birthdate_br #[:hello, :i18n]
    end
  end

  def show
    render json: @contact#, include: [:kind, :address, :phones]
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind, :phones, :address],  status: :created, location: @contact
    else
      render json: ErrorSerializer.serialize(@contact.errors)
         end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind, :phones, :address]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

      def contact_params
      # params.require(:contact).permit(
      #   :name, :email, :birthdate, :kind_id,
      #   phones_attributes: [:id, :number, :_destroy],
      #   address_attributes: [:id, :street, :city]
      # )
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
