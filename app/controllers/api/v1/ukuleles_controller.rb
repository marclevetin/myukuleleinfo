class Api::V1::UkulelesController < ApplicationController
  def index
    render json: Ukulele.all
  end
end
