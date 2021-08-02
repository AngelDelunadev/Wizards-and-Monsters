class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
    render json: @monsters.to_json(include: [ability: { only: %i[name element_type damage] }])
  end

  def show
    @monster = Monster.find(params[:id])
    render json: @monster.to_json(include: [ability: { only: %i[name element_type damage] }])
  end

  def create
    @monster = Monster.create(monster_params)
    render json: @monster
  end

  def update
    @monster = Monster.find(params[:id])
    if @monster.update(monster_params)
      render json: @monster
    else
      render json: { "Error": 'Invalid request' }
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy
    render json: @monster
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :element_type, :hp, :ability_id)
  end
end
