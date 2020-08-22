class DosesController < ApplicationController
  
  def new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(set_dose)
    @dose.cocktail = @cocktail
    add_ingredient(set_ingredient[:ingredient])
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose =  Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def add_ingredient(name)
    @ingredient = Ingredient.find_by_name(name&.downcase)
    if @ingredient
      @dose.ingredient = @ingredient
    else
      @new_ingredient = Ingredient.new(name: name&.downcase)
      if @new_ingredient.valid?
        @new_ingredient.save
        @dose.ingredient = @new_ingredient
      end
    end 
  end

  def set_ingredient
    params.require(:dose).permit(:ingredient)
  end

  def set_dose
    params.require(:dose).permit(:description)
  end
end
