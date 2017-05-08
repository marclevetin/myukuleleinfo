class Api::V1::UkulelesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # protect_from_forgery unless: -> { request.format.json? }

  def index
    # respond_to do |format|
    #   format.json do
    #     render json: { ukuleles: ukuleles }
    #   end
    # end
    @ukuleles = Ukulele.all
    render json: {ukuleles: @ukuleles}
  end

  def create
    @ukuleles = Ukulele.all
    if params[:query]
      query = params[:query]
      @found_records = PgSearch.multisearch(query)
      @ukuleles = []
      @found_records.each do |result|
        @ukuleles << Ukulele.find(result.searchable_id)
      end
      render json: { ukuleles: @ukuleles }
    else
      @ukuleles = ""
    end
  end

  private

  def ukuleles
    params.permit(:query)
  end

end
