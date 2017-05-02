class Api::V1::UkuleleSizesController < ApplicationController
  def index
    render json: { sizes: UkuleleSize.all }
  end
end
