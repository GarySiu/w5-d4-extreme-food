class FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @foods = Food.all
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

end
