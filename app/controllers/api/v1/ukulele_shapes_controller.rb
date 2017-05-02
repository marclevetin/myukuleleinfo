class Api::V1::UkuleleShapesController < ApplicationController
  def index
    render json: { shapes: UkuleleShape.all }
  end
end
