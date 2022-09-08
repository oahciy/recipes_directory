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

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end
end