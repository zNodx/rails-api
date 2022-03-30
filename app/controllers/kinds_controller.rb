class KindsController < ApplicationController

  #TOKEN = "secret123"

  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "jack", password: "secret"

  # include ActionController::HttpAuthentication::Digest::ControllerMethods
  # USERS = { "jack" => Digest::MD5.hexdigest(["jack","Application","secret"].join(":"))}

  TOKEN = "secret123"
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  before_action :set_kind, only: [:show, :update, :destroy]

  def index
    @kinds = Kind.all
    render json: @kinds
  end

  def show
    render json: @kind
  end

  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @kind.destroy
  end

  private
    def set_kind
      if params[:contact_id]
        @kind = Contact.find(params[:contact_id]).kind
        return @kind
      end

      @kind = Kind.find(params[:id])
    end

    def kind_params
      params.require(:kind).permit(:description)
    end

    def authenticate

      hmac_secret = 'my$ecretK3y'
      JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }

      # authenticate_or_request_with_http_token do |token, options|
      #   ActiveSupport::SecurityUtils.secure_compare(
      #     ::Digest::SHA256.hexdigest(token),
      #     ::Digest::SHA256.hexdigest(TOKEN)
      #   )
      end
    end
end
