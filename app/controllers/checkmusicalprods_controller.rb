class CheckmusicalprodsController < ApplicationController
  before_action :set_checkmusicalprod, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token


  def verify
    x=params
    @checkmusicalprod = Checkmusicalprod.find_or_create_by(name: x[:name], country: x[:country])
    @checkmusicalprod.isMusicalprod = x[:isMusicalprod] == "true" ? 1 : 0


    respond_to do |format|
      if @checkmusicalprod.save
        format.html { redirect_to @checkmusicalprod, notice: "Checkmusicalprod was successfully created." }
        format.json { render :show, status: :created, location: @checkmusicalprod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkmusicalprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /checkmusicalprods or /checkmusicalprods.json
  def index
    @checkmusicalprods = Checkmusicalprod.where(isMusicalprod: 1)
    @results=JSON.generate({:musicalprods => @checkmusicalprods.as_json})

  end

  # GET /checkmusicalprods/1 or /checkmusicalprods/1.json
  def show
  end

  # GET /checkmusicalprods/new
  def new
    @checkmusicalprod = Checkmusicalprod.new
  end

  # GET /checkmusicalprods/1/edit
  def edit
  end

  # POST /checkmusicalprods or /checkmusicalprods.json
  def create
    @checkmusicalprod = Checkmusicalprod.new(checkmusicalprod_params)

    respond_to do |format|
      if @checkmusicalprod.save
        format.html { redirect_to @checkmusicalprod, notice: "Checkmusicalprod was successfully created." }
        format.json { render :show, status: :created, location: @checkmusicalprod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkmusicalprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkmusicalprods/1 or /checkmusicalprods/1.json
  def update
    respond_to do |format|
      if @checkmusicalprod.update(checkmusicalprod_params)
        format.html { redirect_to @checkmusicalprod, notice: "Checkmusicalprod was successfully updated." }
        format.json { render :show, status: :ok, location: @checkmusicalprod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkmusicalprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkmusicalprods/1 or /checkmusicalprods/1.json
  def destroy
    @checkmusicalprod.destroy

    respond_to do |format|
      format.html { redirect_to checkmusicalprods_path, status: :see_other, notice: "Checkmusicalprod was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkmusicalprod
      @checkmusicalprod = Checkmusicalprod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkmusicalprod_params
      params.require(:checkmusicalprod).permit(:name, :country, :isMusicalprod)
    end
end
