require_relative 'recipe'

class RecipeRepository
  def all
    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result = DatabaseConnection.exec_params(sql, [])
    
    recipes = []
    result.each do |record|
      recipe = Recipe.new
      recipe.id = record["id"]
      recipe.name = record["name"]
      recipe.cooking_time = record["cooking_time"]
      recipe.rating = record["rating"]
      recipes << recipe
    end
    return recipes
  end

  def find(id)
    sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
    para = [id]
    result = DatabaseConnection.exec_params(sql, para)
    record = result[0]
    recipe = Recipe.new
    recipe.id = record["id"]
    recipe.name = record["name"]
    recipe.cooking_time = record["cooking_time"]
    recipe.rating = record["rating"]
    return recipe
  end
end