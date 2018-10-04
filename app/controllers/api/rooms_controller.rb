class Api::RoomsController < ApplicationController
  def index
    @rooms = Room.all
    render "index.json.jbuilder"
  end

  def show
    @room = Room.find(params[:id])
    render "show.json.jbuilder"
  end
end
