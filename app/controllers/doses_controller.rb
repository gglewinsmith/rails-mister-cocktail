class DosesController < ApplicationController

def create
  @dose = Dose.new(set_params)
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose.cocktail = @cocktail
  if @dose.save
    redirect_to cocktail_path(@cocktail.id)
  else render :new
  end
end

def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new
end

def destroy
  @dose.destroy
  redirect_to cocktail_path(@cocktail.id)
end

  private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
