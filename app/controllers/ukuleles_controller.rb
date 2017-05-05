class UkulelesController < ApplicationController
  def index
    @ukuleles = Ukulele.all
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
    binding.pry
    @user = current_user
    @ukulele = Ukulele.find(params[:id])
    redirect_to user_ukuleles_path(@user)
  end

  private

  def ukulele_params
    params.require(:ukulele).permit(
      :instrument_type,
      :ukulele_shape,
      :ukulele_size,
      :luthier
    )
  end

end
