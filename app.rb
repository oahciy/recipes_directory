# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

repo = RecipeRepository.new
recipes = repo.all
# Print out each record from the result set .
recipes.each do |record|
  p "#{record.name} - #{record.cooking_time} - #{record.rating}"
end