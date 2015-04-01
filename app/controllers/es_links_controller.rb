class EsLinksController < ApplicationController
  before_action :set_es_link, only: [:show, :edit, :update, :destroy]

  # GET /es_links
  # GET /es_links.json
  def index
    @es_links = EsLink.all
  end

  # GET /es_links/1
  # GET /es_links/1.json
  def show
  end

  # GET /es_links/new
  def new
    @es_link = EsLink.new
  end

  # GET /es_links/1/edit
  def edit
  end

  # POST /es_links
  # POST /es_links.json
  def create
    @es_link = EsLink.new(es_link_params)

    respond_to do |format|
      if @es_link.save
        format.html { redirect_to @es_link, notice: 'Es link was successfully created.' }
        format.json { render :show, status: :created, location: @es_link }
      else
        format.html { render :new }
        format.json { render json: @es_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /es_links/1
  # PATCH/PUT /es_links/1.json
  def update
    respond_to do |format|
      if @es_link.update(es_link_params)
        format.html { redirect_to @es_link, notice: 'Es link was successfully updated.' }
        format.json { render :show, status: :ok, location: @es_link }
      else
        format.html { render :edit }
        format.json { render json: @es_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /es_links/1
  # DELETE /es_links/1.json
  def destroy
    @es_link.destroy
    respond_to do |format|
      format.html { redirect_to es_links_url, notice: 'Es link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_es_link
      @es_link = EsLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def es_link_params
      params.require(:es_link).permit(:EvidentionID, :SymptomID, :Description)
    end
end
