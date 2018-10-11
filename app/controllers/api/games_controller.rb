class Api::GamesController < ApplicationController
  def create
    @game = Game.new(
                      code: params[:code]
                    )
    if @game.save
      render 'show.json.jbuilder'
    else
      render "whaa " * 20 
    end
  end

  def show
    @game = Game.find(params[:id])
    render 'show.json.jbuilder'
  end
end

