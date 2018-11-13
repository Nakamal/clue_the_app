class Api::CharactersController < ApplicationController
  
  def index
    @characters = Character.all.order(:game_order)
    render "index.json.jbuilder"
  end

  def show
    @character = Character.find(params[:id])
    render "show.json.jbuilder"
  end
end
