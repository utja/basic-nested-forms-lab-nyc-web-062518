class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'ingredient_one')
    @recipe.ingredients.build(name: 'ingredient_two')
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
    ingredients_attributes: [
      :name,
      :quantity
      ]
    )
  end
end
