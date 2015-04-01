class AnamnesesController < ApplicationController
  before_action :set_anamnese, only: [:show, :edit, :update, :destroy]

  # GET /anamneses
  # GET /anamneses.json
  def index
    @anamneses = Anamnesis.all
  end

  # GET /anamneses/1
  # GET /anamneses/1.json
  def show
  end

  # GET /anamneses/new
  def new
    @anamnese = Anamnesis.new
  end

  # GET /anamneses/1/edit
  def edit
  end

  # POST /anamneses
  # POST /anamneses.json
  def create
    @anamnese = Anamnesis.new(anamnese_params)

    respond_to do |format|
      if @anamnese.save
        format.html { redirect_to @anamnese, notice: 'Anamnesis was successfully created.' }
        format.json { render :show, status: :created, location: @anamnese }
      else
        format.html { render :new }
        format.json { render json: @anamnese.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anamneses/1
  # PATCH/PUT /anamneses/1.json
  def update
    respond_to do |format|
      if @anamnese.update(anamnese_params)
        format.html { redirect_to @anamnese, notice: 'Anamnesis was successfully updated.' }
        format.json { render :show, status: :ok, location: @anamnese }
      else
        format.html { render :edit }
        format.json { render json: @anamnese.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anamneses/1
  # DELETE /anamneses/1.json
  def destroy
    @anamnese.destroy
    respond_to do |format|
      format.html { redirect_to anamneses_url, notice: 'Anamnesis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anamnese
      @anamnese = Anamnesis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anamnese_params
      params.require(:anamnese).permit(:PersonID, :MedicalFacilityID, :DateOfCreation, :UserID, :Remark)
    end
end
