class ProductsController < ApplicationController

  def index
    @products = Products.all
  end

  def new
  end
  def create
    #render plain: params[:products].inspect
    @product = Products.new(products_params)

    @product.save
    redirect_to @product
  end

  def show
    @products = Products.find(params[:id])
  end

  private def products_params
    params.require(:products).permit(:title,:text)
  end
end
