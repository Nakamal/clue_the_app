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
    end
  end

  def sheet
    @participation = Participation.find(params[:id])
    render 'sheet.json.jbuilder'
  end

  def turn_check
    @participation = Participation.find(params[:id])
    @participations = @participation.game.participations
    render 'turn_check.json.jbuilder'
  end


  def take_turn
    room_object = Room.find_by(name: params[:new_location] )
    weapon_object = Weapon.find_by(name: params[:weapon])
    character_object = Character.find_by(name: params[:character])
    @participation = Participation.find(params[:id])

    @participation.change_location(params[:new_location])

    puts "*" * 50
    puts "*" * 50
    puts "*" * 50
    p params
    puts "*" * 50
    puts "*" * 50
    puts "*" * 50

    if params["accusation"] == "true"
      if [room_object, weapon_object, character_object].sort_by { |e| e.class.to_s } == @participation.game.classified_card_subjects.sort_by { |e| e.class.to_s  } 
        render json: {accusation: true}
      else
        render json: {accusation: false}
      end
    else
      @found_cross_over = @participation.update_detective_sheet(room_object, weapon_object, character_object)
      puts "*" * 50
      p @found_cross_over
      puts "-" * 50
      p @participation
      puts "*" * 50
      @participation.game.next_turn
      
      render 'take_turn_suggestion.json.jbuilder'
    end
  end
end
 