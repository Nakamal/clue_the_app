class Api::WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
    render "index.json.jbuilder"
  end

  def show
    @weapon = Weapon.find(params[:id])
    render "show.json.jbuilder"
  end
end
