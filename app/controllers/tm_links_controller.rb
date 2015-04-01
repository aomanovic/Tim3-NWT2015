class TmLinksController < ApplicationController
  before_action :set_tm_link, only: [:show, :edit, :update, :destroy]

  # GET /tm_links
  # GET /tm_links.json
  def index
    @tm_links = TmLink.all
  end

  # GET /tm_links/1
  # GET /tm_links/1.json
  def show
  end

  # GET /tm_links/new
  def new
    @tm_link = TmLink.new
  end

  # GET /tm_links/1/edit
  def edit
  end

  # POST /tm_links
  # POST /tm_links.json
  def create
    @tm_link = TmLink.new(tm_link_params)

    respond_to do |format|
      if @tm_link.save
        format.html { redirect_to @tm_link, notice: 'Tm link was successfully created.' }
        format.json { render :show, status: :created, location: @tm_link }
      else
        format.html { render :new }
        format.json { render json: @tm_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tm_links/1
  # PATCH/PUT /tm_links/1.json
  def update
    respond_to do |format|
      if @tm_link.update(tm_link_params)
        format.html { redirect_to @tm_link, notice: 'Tm link was successfully updated.' }
        format.json { render :show, status: :ok, location: @tm_link }
      else
        format.html { render :edit }
        format.json { render json: @tm_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tm_links/1
  # DELETE /tm_links/1.json
  def destroy
    @tm_link.destroy
    respond_to do |format|
      format.html { redirect_to tm_links_url, notice: 'Tm link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tm_link
      @tm_link = TmLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tm_link_params
      params.require(:tm_link).permit(:TherapyID, :MedicamentID, :Quantity, :Description)
    end
end
