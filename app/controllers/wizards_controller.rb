class WizardsController < ApplicationController
  def index
    @wizards = Wizard.all
    render json: @wizards.to_json(include: [ability: {only:[:name, :element_type, :damage]}])
  end

  def show
    @wizard = Wizard.find(params[:id])
    render json: @wizard.to_json(include: [ability: {only:[:name, :element_type, :damage]}])
  end
  
  def create
    @wizard = Wizard.create(wizard_params)
    if @wizard.id == nil
      render json: {"Erorr": "Invalid request"}
    else
      render json: @wizard 
    end
  end

  def update 
    @wizard = Wizard.find(params[:id])
    if @wizard.update(wizard_params)
      render json: @wizard
    else
      render json: {"Error": "Invalid request"}
    end
  end
  
  def destroy 
    @wizard = Wizard.find(params[:id])
    @wizard.destroy
    render json: @wizard
  end

  private
  def wizard_params
    params.require(:wizard).permit(:name, :element_type, :hp, :ability_id)
  end
end