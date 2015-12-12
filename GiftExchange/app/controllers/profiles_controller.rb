class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @exchange = @profile.exchange
    @profiles = @exchange.profiles
    puts '-'*50
    puts @profiles
    puts '-'*50
    #insane way to get the giftees name
    @giftee = @profiles.map {|x| if x.name == @profile.giftee then x end}.compact
    @giftee.each do |i| @xyz = i.name end 

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @exchange = @profile.exchange

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @exchange, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @exchange = @profile.exchange
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @exchange, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    @exchange = @profile.exchange
    respond_to do |format|
      format.html { redirect_to @exchange, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :description, :address, :user_id, :exchange_id)
    end
end
