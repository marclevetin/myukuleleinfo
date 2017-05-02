class Api::V1::UkuleleSizesController < ApplicationController
  def index
    render json: UkuleleSize.all
  end
end
