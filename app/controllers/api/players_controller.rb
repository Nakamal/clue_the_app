class Api::PlayersController < ApplicationController

  def index
    @players = Player.all
    render 'index.json.jbuilder'
  end
end
