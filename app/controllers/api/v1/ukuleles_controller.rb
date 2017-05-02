class Api::V1::UkulelesController < ApplicationController
  def index
    render json: { ukuleles: Ukulele.all }
  end
end
