class FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @foods = Food.all.order('id DESC')
  end

  def new
  end

  def create
    # binding.pry
    food = Food.new
    food.update(name: params[:name], image_url: params[:image_url], text: params[:text])
    food.save
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
    food.update(name: params[:name], image_url: params[:image_url], text: params[:text])
    food.save
    redirect_to "/foods/#{params[:id]}"
  end

  def delete
    Food.destroy(params[:id])
    redirect_to '/foods'
  end

end
