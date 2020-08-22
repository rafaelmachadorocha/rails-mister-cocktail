class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = params[:id] ? (Cocktail.find(params[:id])) : (Cocktail.find(params[:cocktail_id]))
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(set_params)
    if @cocktail.valid?
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(set_params)
    redirect_to cocktail_path(@cocktail)
  end

  def ingredient
    @cocktails = Cocktail.joins(doses: :ingredient).where('ingredients.name LIKE ?', params[:ingredient]&.downcase)
  end

  private

  def set_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
