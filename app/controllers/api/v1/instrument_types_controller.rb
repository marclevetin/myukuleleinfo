class Api::V1::InstrumentTypesController < ApplicationController
  def index
    render json: { types: InstrumentType.all }
  end
end
