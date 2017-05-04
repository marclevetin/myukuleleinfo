class Api::V1::UkulelesController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery unless: -> { request.format.json? }

  def index
    @current_user = current_user
    @ukuleles = Ukulele.where(user_id: @current_user.id)
    render json: {ukuleles: @ukuleles}
  end

  def add_ukulele
    @current_user = current_user
    @ukulele = Ukulele.new(
      instrument_type: sanitize(params[:instrument_type]),
      luthier: sanitize(params[:luthier]),
      ukulele_shape: sanitize(params[:ukulele_shape]),
      ukulele_size: sanitize(params[:ukulele_size])
    )
    @ukulele.user_id = @current_user.id
    if @ukulele.valid?
      @ukulele.save
      render json: { status: "Success", ukulele: @ukulele }
    else
      render json: { errors: @ukulele.errors.full_messages }
    end
  end

  private

  def ukulele_params
    params.require(:ukulele).permit(
      :instrument_type,
      :luthier,
      :ukulele_shape,
      :ukulele_size
    )
  end

  def sanitize(input)
    ActionController::Base.helpers.sanitize(input)

  end
end
