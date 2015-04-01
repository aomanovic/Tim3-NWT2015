class MasterMedicalFacilitiesController < ApplicationController
  before_action :set_master_medical_facility, only: [:show, :edit, :update, :destroy]

  # GET /master_medical_facilities
  # GET /master_medical_facilities.json
  def index
    @master_medical_facilities = MasterMedicalFacility.all
  end

  # GET /master_medical_facilities/1
  # GET /master_medical_facilities/1.json
  def show
  end

  # GET /master_medical_facilities/new
  def new
    @master_medical_facility = MasterMedicalFacility.new
  end

  # GET /master_medical_facilities/1/edit
  def edit
  end

  # POST /master_medical_facilities
  # POST /master_medical_facilities.json
  def create
    @master_medical_facility = MasterMedicalFacility.new(master_medical_facility_params)

    respond_to do |format|
      if @master_medical_facility.save
        format.html { redirect_to @master_medical_facility, notice: 'Master medical facility was successfully created.' }
        format.json { render :show, status: :created, location: @master_medical_facility }
      else
        format.html { render :new }
        format.json { render json: @master_medical_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_medical_facilities/1
  # PATCH/PUT /master_medical_facilities/1.json
  def update
    respond_to do |format|
      if @master_medical_facility.update(master_medical_facility_params)
        format.html { redirect_to @master_medical_facility, notice: 'Master medical facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_medical_facility }
      else
        format.html { render :edit }
        format.json { render json: @master_medical_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_medical_facilities/1
  # DELETE /master_medical_facilities/1.json
  def destroy
    @master_medical_facility.destroy
    respond_to do |format|
      format.html { redirect_to master_medical_facilities_url, notice: 'Master medical facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_medical_facility
      @master_medical_facility = MasterMedicalFacility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_medical_facility_params
      params.require(:master_medical_facility).permit(:Code, :Name, :Address, :Telephone)
    end
end
