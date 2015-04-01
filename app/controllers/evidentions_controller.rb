class EvidentionsController < ApplicationController
  before_action :set_evidention, only: [:show, :edit, :update, :destroy]

  # GET /evidentions
  # GET /evidentions.json
  def index
    @evidentions = Evidention.all
  end

  # GET /evidentions/1
  # GET /evidentions/1.json
  def show
  end

  # GET /evidentions/new
  def new
    @evidention = Evidention.new
  end

  # GET /evidentions/1/edit
  def edit
  end

  # POST /evidentions
  # POST /evidentions.json
  def create
    @evidention = Evidention.new(evidention_params)

    respond_to do |format|
      if @evidention.save
        format.html { redirect_to @evidention, notice: 'Evidention was successfully created.' }
        format.json { render :show, status: :created, location: @evidention }
      else
        format.html { render :new }
        format.json { render json: @evidention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidentions/1
  # PATCH/PUT /evidentions/1.json
  def update
    respond_to do |format|
      if @evidention.update(evidention_params)
        format.html { redirect_to @evidention, notice: 'Evidention was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidention }
      else
        format.html { render :edit }
        format.json { render json: @evidention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidentions/1
  # DELETE /evidentions/1.json
  def destroy
    @evidention.destroy
    respond_to do |format|
      format.html { redirect_to evidentions_url, notice: 'Evidention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidention
      @evidention = Evidention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidention_params
      params.require(:evidention).permit(:AnamnesisID, :PersonID, :MedicalStuffID, :Date, :Remark)
    end
end
