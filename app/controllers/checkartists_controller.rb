class CheckartistsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_checkartist, only: %i[ show edit update destroy ]

  # GET /checkartists or /checkartists.json
  def index
    @checkartists = Checkartist.where(isArtist: 1)
    @results=JSON.generate({:artists => @checkartists.as_json})
  end

  # GET /checkartists/1 or /checkartists/1.json
  def show
  end

  # GET /checkartists/new
  def new
    @checkartist = Checkartist.new
  end

  # GET /checkartists/1/edit
  def edit
  end

  # POST /checkartists or /checkartists.json
  def create
    @checkartist = Checkartist.new(checkartist_params)

    respond_to do |format|
      if @checkartist.save
        format.html { redirect_to @checkartist, notice: "Checkartist was successfully created." }
        format.json { render :show, status: :created, location: @checkartist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkartist.errors, status: :unprocessable_entity }
      end
    end
  end
  def verify
    x=params
    @checkartist = Checkartist.find_or_create_by(name: x[:name], country: x[:country])
    @checkartist.isArtist = x[:isArtist] == "true" ? 1 : 0


    respond_to do |format|
      if @checkartist.save
        format.html { redirect_to @checkartist, notice: "Checkartist was successfully created." }
        format.json { render :show, status: :created, location: @checkartist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkartist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkartists/1 or /checkartists/1.json
  def update
    respond_to do |format|
      if @checkartist.update(checkartist_params)
        format.html { redirect_to @checkartist, notice: "Checkartist was successfully updated." }
        format.json { render :show, status: :ok, location: @checkartist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkartist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkartists/1 or /checkartists/1.json
  def destroy
    @checkartist.destroy

    respond_to do |format|
      format.html { redirect_to checkartists_path, status: :see_other, notice: "Checkartist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkartist
      @checkartist = Checkartist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkartist_params
      params.require(:checkartist).permit(:name, :country, :isArtist)
    end
end
