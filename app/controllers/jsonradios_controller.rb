class JsonradiosController < ApplicationController
  before_action :set_jsonradio, only: %i[ nommusiques1 downloadmusic2 show edit update destroy ]

  # GET /jsonradios or /jsonradios.json
  def index
    @jsonradios = Jsonradio.all
  end

  # GET /jsonradios/1 or /jsonradios/1.json
  def show
  end
  def nommusiques1
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack METIS 1 lancer en meme temps le script 2' && bash -l -c 'sh ./jsonradio1.sh \'#{@jsonradio.mysong}\' \'json#{@jsonradio.id}\' \'#{@jsonradio.numberid}\''"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def downloadmusic2
# first argument : radio numero (id)
# 2nd argument : +/-
# 3nd argument : +/- hours gmt
# 4eme argument : +/- minute gmt

    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack METIS script numero 2' && bash -l -c 'sh ./scriptjsonradio.sh  \'json#{@jsonradio.id}\' \'#{@jsonradio.mytime[0]}\' \'#{@jsonradio.mytime[1..2].to_i}\' \'#{@jsonradio.mytime[4..5].to_i}\' \'#{@jsonradio.stream}\''"`
      end
    end
    threads << thread
    @res=threads.join
  end


  # GET /jsonradios/new
  def new
    @jsonradio = Jsonradio.new
  end

  # GET /jsonradios/1/edit
  def edit
  end

  # POST /jsonradios or /jsonradios.json
  def create
    @jsonradio = Jsonradio.new(jsonradio_params)

    respond_to do |format|
      if @jsonradio.save
        format.html { redirect_to jsonradio_url(@jsonradio), notice: "Jsonradio was successfully created." }
        format.json { render :show, status: :created, location: @jsonradio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jsonradio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jsonradios/1 or /jsonradios/1.json
  def update
    respond_to do |format|
      if @jsonradio.update(jsonradio_params)
        format.html { redirect_to jsonradio_url(@jsonradio), notice: "Jsonradio was successfully updated." }
        format.json { render :show, status: :ok, location: @jsonradio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jsonradio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jsonradios/1 or /jsonradios/1.json
  def destroy
    @jsonradio.destroy

    respond_to do |format|
      format.html { redirect_to jsonradios_url, notice: "Jsonradio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jsonradio
      @jsonradio = Jsonradio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jsonradio_params
      params.require(:jsonradio).permit(:name, :pic, :stream, :mysong, :mytime, :numberid)
    end
end
