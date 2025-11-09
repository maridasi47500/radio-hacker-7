class RssradiosController < ApplicationController
  before_action :set_rssradio, only: %i[ scriptradio show edit update destroy ]

  # GET /rssradios or /rssradios.json
  def index
    @rssradios = Rssradio.all
  end
  def scriptradio
# first argument : rss radio feed
# 2nd argument : radio numero
# 3rd argument : mp3 radio stream
#4nd argument : +/-
#5nd argument : +/- hours gmt
#6eme argument : +/- minute gmt

    threads=[]
    p "cd #{Rails.root.to_s}/lib/assets && echo 'entrez le mot de passe et entrez rails s' && bash -l -c 'sh ./rssscript.sh \'#{@rssradio.mysong}\' \'rss#{@rssradio.id}\' \'#{@rssradio.stream}\' \'#{@rssradio.mytime[0]}\' \'#{@rssradio.mytime[1..2].to_i}\' \'#{@rssradio.mytime[4..5].to_i}\''"
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'entrez le mot de passe et entrez rails s' && bash -l -c 'sh ./rssscript.sh \'#{@rssradio.mysong}\' \'rss#{@rssradio.id}\' \'#{@rssradio.stream}\' \'#{@rssradio.mytime[0]}\' \'#{@rssradio.mytime[1..2].to_i}\' \'#{@rssradio.mytime[4..5].to_i}\''"`
      end
    end
    threads << thread
    @res=threads.join
  end

  # GET /rssradios/1 or /rssradios/1.json
  def show
  end

  # GET /rssradios/new
  def new
    @rssradio = Rssradio.new
  end

  # GET /rssradios/1/edit
  def edit
  end

  # POST /rssradios or /rssradios.json
  def create
    @rssradio = Rssradio.new(rssradio_params)

    respond_to do |format|
      if @rssradio.save
        format.html { redirect_to rssradio_url(@rssradio), notice: "Rssradio was successfully created." }
        format.json { render :show, status: :created, location: @rssradio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rssradio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rssradios/1 or /rssradios/1.json
  def update
    respond_to do |format|
      if @rssradio.update(rssradio_params)
        format.html { redirect_to rssradio_url(@rssradio), notice: "Rssradio was successfully updated." }
        format.json { render :show, status: :ok, location: @rssradio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rssradio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rssradios/1 or /rssradios/1.json
  def destroy
    @rssradio.destroy

    respond_to do |format|
      format.html { redirect_to rssradios_url, notice: "Rssradio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rssradio
      @rssradio = Rssradio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rssradio_params
      params.require(:rssradio).permit(:name, :pic, :stream, :mysong, :mytime)
    end
end
