class AbilitiesController < ApplicationController
  def index
    @abilities = Ability.all
    render json: @abilities 
  end

  def show
    @ability = Ability.find(params[:id])
    render json: @ability

  end

  def new
    @ability = Ability.new
    render json: @ability
  end

  def create
    @ability = Ability.create(ability_params)
    if @ability.id == nil
      render json: {"Erorr": "Not all fields present"}
    else
      render json: @ability
    end
  end

  def update 
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      render json: @ability
    else
      render json: {"Error": "Invalid request"}
    end
  end
  
  def destroy 
    @ability = Ability.find(params[:id])
    @ability.destroy
    render json: @ability
  end

  private
    def ability_params
      params.require(:ability).permit(:name, :element_type, :damage)
    end
  
end