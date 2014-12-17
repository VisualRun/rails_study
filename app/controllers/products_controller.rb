class ProductsController < ApplicationController
  def new
  end
  def create
    #render plain: params[:products].inspect
    @product = Products.new(params[:products])
    
    @product.save
    redirect_to @product
  end
end
