class FoodsController < ApplicationController
  def home
    redirect_to '/foods'
  end
  def index
    @foods = Food.all.order('id DESC')
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new
    food.update(food_params)
    food.save
    redirect_to "/foods/#{food.id}"
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    food.save
    redirect_to "/foods/#{params[:id]}"
  end

  def destroy
    Food.destroy(params[:id])
    redirect_to '/foods'
  end

private

  def food_params
      params.require(:food).permit(:name, :image_url, :text)
  end

end
