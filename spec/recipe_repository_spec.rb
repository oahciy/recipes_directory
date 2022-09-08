require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "gets all recipes and return an array of them" do
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes[0].name).to eq 'Buffalo Wings'
    expect(recipes[0].cooking_time).to eq '40'
    expect(recipes[0].rating).to eq '5'
    expect(recipes[1].name).to eq 'Glazed Salmon'
    expect(recipes[1].cooking_time).to eq '70'
    expect(recipes[1].rating).to eq '4'
  end
end