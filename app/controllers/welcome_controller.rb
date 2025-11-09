require 'assets/whattodo'
class WelcomeController < ActionController::Base
    protect_from_forgery except: :index
  def index
    @songs = Radio.new.getallsongs
    console
  respond_to do |format|
    format.html  { render }
    format.js  { render }
  end
  end
end
