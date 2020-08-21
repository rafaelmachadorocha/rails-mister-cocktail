class DosesController < ApplicationController
  
  before_action :new_dose, only:[:new, :from_show]
  
  def new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(set_dose)
    @dose.cocktail = @cocktail
    param_ingredient = set_ingredient[:ingredient].downcase
    @dose.ingredient = add_ingredient(param_ingredient)
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
  end

  def from_show
  end

  private

  def add_ingredient(parameter)
    ingredient = Ingredient.find_by_name(parameter)
    if ingredient
      ingredient
    else
      new_ingredient = Ingredient.new(name: parameter)
      new_ingredient.save
      new_ingredient
    end 
  end

  def new_dose
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def set_ingredient
    params.require(:dose).permit(:ingredient)
  end

  def set_dose
    params.require(:dose).permit(:description)
  end
end
