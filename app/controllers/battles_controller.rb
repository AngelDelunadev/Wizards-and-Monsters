class BattlesController < ApplicationController

  def index 
    @battles = Battle.all
    render json: @battles.to_json(include: [monster: { only: %i[name element_type hp] }, wizard: { only: %i[name element_type hp] }])
  end

  def show
    @battle =  Battle.find(params[:id])
    render json: @battle.to_json(include: [monster: { only: %i[name element_type hp] }, wizard: { only: %i[name element_type hp] }])
  end

  def battle
    monster = Monster.find(params[:monster_id])
    wizard = Wizard.find(params[:wizard_id])
    wizard_dmg_taken = Ability.find(monster.ability_id).damage
    monster_dmg_taken = Ability.find(wizard.ability_id).damage

    if wizard.element_type == "Fire" && monster.element_type == "Earth"
      monster_dmg_taken = monster_dmg_taken*2
    elsif wizard.element_type == "Water" && monster.element_type == "Fire"
      monster_dmg_taken = monster_dmg_taken*2
    elsif wizard.element_type == "Earth" && monster.element_type == "Water"
      monster_dmg_taken = monster_dmg_taken*2
    elsif wizard.element_type == "Earth" && monster.element_type == "Fire"
      wizard_dmg_taken = wizard_dmg_taken*2
    elsif wizard.element_type == "Fire" && monster.element_type == "Water"
      wizard_dmg_taken = wizard_dmg_taken*2
    elsif wizard.element_type == "Water" && monster.element_type == "Earth"
      wizard_dmg_taken = wizard_dmg_taken*2
    end

    wizard_hp = wizard.hp - wizard_dmg_taken
    monster_hp = monster.hp - monster_dmg_taken

    results = ""
    if wizard_hp == 0 && monster_hp == 0
      results = "mutual_destruction"
    elsif wizard_hp == monster_hp
      results = "draw"
    elsif wizard_hp < monster_hp
      results = "monster"
    else 
      results = "wizard"
    end
    
    
    render json: Battle.create(results: results, monster_id: monster.id, wizard_id: wizard.id)

  end
end