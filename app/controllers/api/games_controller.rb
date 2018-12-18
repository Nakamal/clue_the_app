class Api::GamesController < ApplicationController
  def create
    Decking.where("created_at < ?", 1.day.ago).destroy_all
    Participation.where("created_at < ?", 1.day.ago).destroy_all
    SheetInfo.where("created_at < ?", 1.day.ago).destroy_all
    Game.where("created_at < ?", 1.day.ago).destroy_all

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

  def start_game
    @game = Game.find(params["id"])
    
    unless @game.start_game
      @game.build_deck # ==============before
      @game.assign_first_character
    end
    
    @game.update(start_game: true) # ====== after

    if @game.start_game 
      render json: {start_game: true}
    else
      render json: {keep_waiting: true}
    end
  end
end

