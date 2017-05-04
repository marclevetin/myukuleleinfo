class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery unless: -> { request.format.json? }

  def index
    @current_user = current_user
    @ukuleles = Ukulele.where(user_id: @current_user.id)
    render json: {current_user: @current_user, events: @events }
  end
end
