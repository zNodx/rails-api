class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = Contact.all

    render json: @contacts #, methods: :birthdate_br #[:hello, :i18n]
  end

  def show
    render json: @contact, include: [:kind, :address, :phones] #, meta: { author: "Jackson Pires" }   #, include: [:kind, :phones, :address]
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind, :phones, :address],  status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
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
