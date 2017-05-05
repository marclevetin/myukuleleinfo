class UkulelesController < ApplicationController
  before_action :set_uke, only [:edit, :destroy]

  def index
    @ukuleles = Ukulele.all
  end

  def edit

  end

  def new
    @ukulele = Ukulele.new
    @user = current_user
    @instrument_type = InstrumentType.all
    @ukulele_shape = UkuleleShape.all
    @ukulele_size = UkuleleSize.all
  end

  def create
    @user = current_user
    @ukulele = Ukulele.create(ukulele_params)
    @ukulele.user = @user

    if @ukulele.save
      flash[:notice] = "Ukulele saved"
      redirect_to user_ukuleles_path(@user)
    else
      flash[:alert] = "Ukulele didn't save.  Try again."
      render :new
    end
  end

  def show
    @ukulele = Ukulele.find(params[:id])
  end

  def destroy
    @ukulele.destroy
    respond_to do |format|
      format.html { redirect_to user_ukuleles_path(current_user), notice: 'Ukulele was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_uke
    @ukelele = Ukulele.find(params[:id])
  end

  def ukulele_params
    params.require(:ukulele).permit(
      :instrument_type,
      :ukulele_shape,
      :ukulele_size,
      :luthier
    )
  end

end
