class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(set_params)
    if @cocktail.valid?
      @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
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

  def edit_from_show
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(set_params)
    params[:from_show] == 'true' ? (redirect_to cocktail_path(@cocktail)) : (redirect_to new_cocktail_dose_path(params[:id]))
  end

  def ingredient
    @cocktails = Cocktail.joins(doses: :ingredient).where('ingredients.name LIKE ?', params[:ingredient].downcase)
  end

  private

  def set_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
