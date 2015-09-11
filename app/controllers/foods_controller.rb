class FoodsController < ApplicationController

  def index
    @foods = Food.all.order('id DESC')
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new
    food.update(food_params)
    if food.save
      redirect_to food
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    if(food.update(food_params))
      redirect_to article
    else
      render:edit
    end
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
