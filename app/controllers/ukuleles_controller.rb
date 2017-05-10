class UkulelesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_uke, only: [:edit, :destroy, :update]


  def create
    binding.pry
    @user = current_user
    @ukulele = Ukulele.create(ukulele_params)
    @ukulele.user = @user

    if @ukulele.save
      flash[:notice] = "Ukulele saved"
      redirect_to user_ukulele_path(@user, @ukulele)
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
    @ukuleles = Ukulele.where(user_id: current_user)
    @vbulletin = []
    @ukuleles.each do |uke|
      @vbulletin << uke.vbulletin
    end

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
    @nickname = set_nickname
    @vbulletin = @ukulele.vbulletin
    @youtube = @ukulele.youtube(@ukulele.video)
  end

  def update
    respond_to do |format|
      if @ukulele.update(ukulele_params)
        format.html { redirect_to redirect_to user_ukulele_path(@user, @ukulele), notice: 'Ukulele was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def set_uke
    @ukulele = Ukulele.find(params[:id])
  end

  def set_nickname
    if @ukulele.nickname
      @ukulele.nickname
    else
      "My Ukulele"
    end
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
      { photos: [] },
      :nickname,
      :video
    )
  end

end
