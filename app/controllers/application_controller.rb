class ApplicationController < ActionController::Base
  before_action :yeah
  def yeah
     @rssradios = Rssradio.all
     @jsonradios = Jsonradio.all
  end
end
