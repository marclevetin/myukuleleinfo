class UkulelesController < ApplicationController
  before_action :set_uke, only: [:edit, :destroy, :update]

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

  def destroy
    @ukulele.destroy
    respond_to do |format|
      format.html { redirect_to user_ukuleles_path(current_user), notice: 'Ukulele was successfully deleted.' }
    end
  end

  def edit
    @instrument_type = InstrumentType.all
    @ukulele_shape = UkuleleShape.all
    @ukulele_size = UkuleleSize.all
  end

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

  def show
    @ukulele = Ukulele.find(params[:id])
  end

  def update
    respond_to do |format|
      if @ukulele.update(ukulele_params)
        format.html { redirect_to user_ukuleles_path(current_user), notice: 'Ukulele was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def set_uke
    @ukulele = Ukulele.find(params[:id])
  end

  def ukulele_params
    params.require(:ukulele).permit(
      :instrument_type,
      :ukulele_shape,
      :ukulele_size,
      :luthier,
      :model,
      :serial_number,
      :purchase_date,
      :body_top,
      :body_sides,
      :body_back,
      :body_neck,
      :body_fretboard,
      :body_binding,
      :tuner_type,
      :tuner_manufacture,
      :string_manufacture,
      :string_count,
      :string_tuning,
      :finish_type,
      :finish_look,
      :pickup,
      :nut_material,
      :saddle_material,
      :neck_width,
      :length_scale,
      :length_body,
      :width,
      :depth,
      {photos: []}
    )
  end

end
