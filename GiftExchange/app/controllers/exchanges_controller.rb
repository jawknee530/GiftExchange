class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show, :edit, :update, :destroy, :assign]

  def assign
    redirect_to @exchange
  end

  def remove
    redirect_to @exchange
  end

  # GET /exchanges
  # GET /exchanges.json
  def index
    @exchanges = Exchange.all
    if current_user then
      @yourExchanges = Exchange.where("user_id = ?", current_user.id)
      @otherExchanges = @exchanges - @yourExchanges
    else @otherExchanges = @exchanges
    end
    if current_user then
      joined = false
      @joinedExchanges = @exchanges.map {|x| x.profiles.each do |i| 
                                               if i.user_id == current_user.id then 
                                                 joined = true else joined = false
                                               end
                                             end
                                             if joined then x end}.compact
    end
    puts '-'*50
    puts @joinedExchanges
    puts '-'*50
  end

  # GET /exchanges/1
  # GET /exchanges/1.json
  def show
    @profiles = @exchange.profiles
    @joined = false
    if @exchange.Deadline == "PASSED" && !@profiles[0].giftee then 

        done = false
        @gifters = @exchange.profiles
        puts '-'*50
        puts @gifters
        puts '-'*50
        while done == false do
          done = true
          @giftees = @exchange.profiles.order('random()')
          puts '-'*50
          puts @giftees
          puts '-'*50
          @gifters.each_index do |i|
            if @gifters[i].id == @giftees[i].id then
              done = false
            end
          end
          @gifters.each_index do |i|
            puts @gifters[i]
            puts @gifters[i].name
            @gifters[i].giftee = @giftees[i].name
            puts @gifters[i].giftee
            puts '*'*50
            @gifters[i].save
          end
        end

    end
  end

  # GET /exchanges/new
  def new
    @exchange = Exchange.new
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges
  # POST /exchanges.json
  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to @exchange, notice: 'Exchange was successfully created.' }
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchanges/1
  # PATCH/PUT /exchanges/1.json
  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to @exchange, notice: 'Exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchanges/1
  # DELETE /exchanges/1.json
  def destroy
    @exchange.destroy
    respond_to do |format|
      format.html { redirect_to exchanges_url, notice: 'Exchange was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
      params.require(:exchange).permit(:name, :Description, :Deadline, :Date, :user_id)
    end
end
