class SynthesController < ApplicationController
  before_action :set_synthe, only: %i[ show edit update destroy ]

  # GET /synthes or /synthes.json
  def index
    @synthes = Synthe.all
  end

  # GET /synthes/1 or /synthes/1.json
  def show
  end

  # GET /synthes/new
  def new
    @synthe = Synthe.new
  end

  # GET /synthes/1/edit
  def edit
  end

  # POST /synthes or /synthes.json
  def create
    @synthe = Synthe.new(synthe_params)

    respond_to do |format|
      if @synthe.save
        format.html { redirect_to synthe_url(@synthe), notice: "Synthe was successfully created." }
        format.json { render :show, status: :created, location: @synthe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @synthe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synthes/1 or /synthes/1.json
  def update
    respond_to do |format|
      if @synthe.update(synthe_params)
        format.html { redirect_to synthe_url(@synthe), notice: "Synthe was successfully updated." }
        format.json { render :show, status: :ok, location: @synthe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @synthe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synthes/1 or /synthes/1.json
  def destroy
    @synthe.destroy

    respond_to do |format|
      format.html { redirect_to synthes_url, notice: "Synthe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synthe
      @synthe = Synthe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def synthe_params
      params.require(:synthe).permit(:song_id)
    end
end
