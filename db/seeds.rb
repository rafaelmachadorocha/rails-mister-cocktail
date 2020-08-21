# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all
6.times do
  cocktail = Cocktail.create!(name: Faker::DcComics.unique.heroine)

  3.times do
    dose = Dose.new(description: Faker::Food.measurement)
    ingredient = Ingredient.create!(name: Faker::Beer.unique.name)
    dose.cocktail = cocktail
    dose.ingredient = ingredient
    dose.save!
  end

end
