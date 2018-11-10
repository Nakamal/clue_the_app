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

  def start_game
    @game = Game.find(params["id"])
    puts "game started"
    @game.update(start_game: true)
    @game.build_deck
    @game.assign_first_character

    if @game.start_game 
      puts "happy path"
      render json: {start_game: true}
    else
      puts "sad path"
      render json: {keep_waiting: true}
    end
  end
end

