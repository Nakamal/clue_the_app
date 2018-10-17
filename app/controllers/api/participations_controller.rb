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
    room_object = Room.find_by(name: params[:new_location] )
    weapon_object = Weapon.find_by(name: params[:weapon])
    character_object = Character.find_by(name: params[:character])
    @participation = Participation.find(params[:id])

    @participation.change_location(params[:new_location])

    if params["accusation"] == "true"
      if [room_object, weapon_object, character_object].sort_by { |e| e.class.to_s } == @participation.game.classified_card_subjects.sort_by { |e| e.class.to_s  } 
        render json: {message: "You've solved the case, you win"}
      else
        render json: {message: "You Lose, Good Day Sir!"}
      end
    else
      character_id_list = @participation.game.characters.order(id: :desc).pluck(:id)
      position = character_id_list.index(@participation.character_id)
      character_id_list.rotate(position + 1)

      character_id_list.each do |character_id|
        checking_cards = @participation.game.participations.find_by(character_id: character_id).cards.map {|card| card.subject }
        suggested = [room_object, weapon_object, character_object]
        cross_over = (checking_cards & suggested).sample
        if cross_over
          render json: {cross_over: cross_over}
          return
        end
      end

      @participation.game.next_turn
    end
  end
end
 