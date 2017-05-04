class UkulelesController < ApplicationController
  def index
    @ukuleles = Ukulele.all
  end

  def new
    @ukulele = Ukulele.new
    @user = current_user
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
