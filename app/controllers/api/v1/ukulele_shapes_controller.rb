class Api::V1::UkuleleShapesController < ApplicationController
  def index
    render json: UkuleleShape.all
  end
end
