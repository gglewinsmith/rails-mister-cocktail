class CocktailsController < ApplicationController
  before_action :find, only: %w[show edit update destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    Cocktail.create(set_params)
    redirect_to cocktails_path
  end

  def edit
  end

  def update
    @cocktail.update(set_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_params
    params.require(:cocktail).permit(:name)
  end

  def find
    @cocktail = Cocktail.find(params[:id])
  end
end
