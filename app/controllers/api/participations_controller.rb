class Api::ParticipationsController < ApplicationController

  def index
    game = Game.find(params[:game_id])
    @participations = game.participations
    render 'index.json.jbuilder'
  end

  def create
    @participation = Participation.create(
                                         player_id: params[:player_id],
                                         game_id: params[:game_id],
                                         character_id: params[:character_id],
                                         current_location: "start"
                                        )
    if @participation.save
      render "show.json.jbuilder"
    else
      game = Game.find(params[:game_id])
      @participations = game.participations
      @message = "You cannot choose that character, please choose a different suspect."
    end
  end

  def sheet
    @participation = Participation.find(params[:id])
    render 'sheet.json.jbuilder'
  end

  def turn_check
    @participation = Participation.find(params[:id])
    render json: {my_turn: @participation.my_turn? }
  end

  def take_turn
    @participation = Participation.find(params[:id])

    @participation.change_location(params[:new_location])

    @participation.game.next_turn
    render json: {message: 'It worked, whats next'}
  end
end
 