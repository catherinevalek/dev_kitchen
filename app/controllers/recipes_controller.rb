class RecipesController < ApplicationController

  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
   # binding.pry
    if params[:search]

      @recipes = Recipe.search(params[:search]).order("created_at DESC")
    else
      @recipes = Recipe.all.order("created_at DESC")
      # flash[:error] = "Couldn't find a recipe!"
      # redirect_to recipes_url
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # binding.pry
    #find current user and assign them to recipe
    @recipe.user = current_user
    if @recipe.save
      flash[:success] = "Your recipe has been added!"
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Your changes have been updated!"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted"
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:category_id, :name, :difficulty, :prep_time, :ingredients, :directions)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  def correct_user
    @recipe = Recipe.find(params[:id])
    @user = current_user
    redirect_to root_path unless @user == @recipe.user
  end
end
