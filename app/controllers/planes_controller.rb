class PlanesController < ApplicationController
  before_action :set_plane, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /planes
  # GET /planes.json
  def index
    @planes = Plane.all
    @plane = Plane.new
  end

  # GET /planes/new
  def new
    @plane = Plane.new
  end

  # GET /planes/1/edit
  def edit
  end

  # POST /planes
  # POST /planes.json
  def create
    @plane = Plane.new(plane_params)

    respond_to do |format|
      if @plane.save
        format.html { redirect_to planes_path, notice: 'Plane was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        format.js { render :new}
      end
    end
  end

  # PATCH/PUT /planes/1
  # PATCH/PUT /planes/1.json
  def update
    respond_to do |format|
      if @plane.update(plane_params)
        format.html { redirect_to planes_path, notice: 'Plane was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end

  # DELETE /planes/1
  # DELETE /planes/1.json
  def destroy
    @plane.destroy
    respond_to do |format|
      format.html { redirect_to planes_url, notice: 'Plane was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      @plane = Plane.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plane_params
      params.require(:plane).permit(:ac_type, :name, :state)
    end
end
