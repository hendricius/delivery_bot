class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy, :become]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
    @driver.max_capacity = 3
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render action: 'show', status: :created, location: @driver }
      else
        format.html { render action: 'new' }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url }
      format.json { head :no_content }
    end
  end

  # Become the driver
  def become
    @body_id = "drivers_become"
    @orders = @driver.orders
    if @orders.length == 1
      @directions = {"direction" =>
                      {"data" =>
                        { "from" => @driver.address, "to" => @orders.first.address }
                      }
                    }
    else
      waypoints = @orders[0...-1].map{|order| order.address }
      @directions = {
                      "direction" =>
                        {"data" =>
                          {
                            "from" => @driver.address, "to" => @orders.last.address }
                        },
                      "options" =>
                        {"waypoints" => waypoints }
                      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      id = params[:id] || params[:driver_id]
      @driver = Driver.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:headquarter_id, :name, :phone, :street,
        :zipcode, :city, :country, :current_capacity, :max_capacity)
    end
end
