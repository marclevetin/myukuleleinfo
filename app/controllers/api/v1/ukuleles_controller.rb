class Api::V1::UkulelesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery unless: -> { request.format.json? }

  def index
    @ukuleles = Ukulele.all
    render json: {ukuleles: @ukuleles}
  end

end
