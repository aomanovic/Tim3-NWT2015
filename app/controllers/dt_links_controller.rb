class DtLinksController < ApplicationController
  before_action :set_dt_link, only: [:show, :edit, :update, :destroy]

  # GET /dt_links
  # GET /dt_links.json
  def index
    @dt_links = DtLink.all
  end

  # GET /dt_links/1
  # GET /dt_links/1.json
  def show
  end

  # GET /dt_links/new
  def new
    @dt_link = DtLink.new
  end

  # GET /dt_links/1/edit
  def edit
  end

  # POST /dt_links
  # POST /dt_links.json
  def create
    @dt_link = DtLink.new(dt_link_params)

    respond_to do |format|
      if @dt_link.save
        format.html { redirect_to @dt_link, notice: 'Dt link was successfully created.' }
        format.json { render :show, status: :created, location: @dt_link }
      else
        format.html { render :new }
        format.json { render json: @dt_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dt_links/1
  # PATCH/PUT /dt_links/1.json
  def update
    respond_to do |format|
      if @dt_link.update(dt_link_params)
        format.html { redirect_to @dt_link, notice: 'Dt link was successfully updated.' }
        format.json { render :show, status: :ok, location: @dt_link }
      else
        format.html { render :edit }
        format.json { render json: @dt_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dt_links/1
  # DELETE /dt_links/1.json
  def destroy
    @dt_link.destroy
    respond_to do |format|
      format.html { redirect_to dt_links_url, notice: 'Dt link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dt_link
      @dt_link = DtLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dt_link_params
      params.require(:dt_link).permit(:DiagnoseID, :TherapyID, :Description)
    end
end
