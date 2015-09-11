class FoodsController < ApplicationController
  def index
    @foods = Food.all.order('id DESC')
  end

  def new
    @food = Food.new
  end

  def create
    # binding.pry
    # food = Food.new
    # food.update(name: params[:name], image_url: params[:image_url], text: params[:text])
    # food.save
    Food.create(food_params)
    redirect_to '/foods'
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
