class Api::V1::InstrumentTypesController < ApplicationController
  def index
    render json: InstrumentType.all
  end
end
