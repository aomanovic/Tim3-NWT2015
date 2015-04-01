class EdLinksController < ApplicationController
  before_action :set_ed_link, only: [:show, :edit, :update, :destroy]

  # GET /ed_links
  # GET /ed_links.json
  def index
    @ed_links = EdLink.all
  end

  # GET /ed_links/1
  # GET /ed_links/1.json
  def show
  end

  # GET /ed_links/new
  def new
    @ed_link = EdLink.new
  end

  # GET /ed_links/1/edit
  def edit
  end

  # POST /ed_links
  # POST /ed_links.json
  def create
    @ed_link = EdLink.new(ed_link_params)

    respond_to do |format|
      if @ed_link.save
        format.html { redirect_to @ed_link, notice: 'Ed link was successfully created.' }
        format.json { render :show, status: :created, location: @ed_link }
      else
        format.html { render :new }
        format.json { render json: @ed_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ed_links/1
  # PATCH/PUT /ed_links/1.json
  def update
    respond_to do |format|
      if @ed_link.update(ed_link_params)
        format.html { redirect_to @ed_link, notice: 'Ed link was successfully updated.' }
        format.json { render :show, status: :ok, location: @ed_link }
      else
        format.html { render :edit }
        format.json { render json: @ed_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ed_links/1
  # DELETE /ed_links/1.json
  def destroy
    @ed_link.destroy
    respond_to do |format|
      format.html { redirect_to ed_links_url, notice: 'Ed link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ed_link
      @ed_link = EdLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ed_link_params
      params.require(:ed_link).permit(:EvidentionID, :DiagnoseID, :Description)
    end
end
