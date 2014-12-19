class ProductsController < ApplicationController

  def index
    @products = Products.all
  end

  def new
    @product = Products.new
  end
  def create
    #render plain: params[:products].inspect
    @product = Products.new(products_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @products = Products.find(params[:id])
  end

  def edit
    p params
    @product = Products.find(params[:id])
  end

  def update
    @product = Products.find(params[:id])
 
    if @product.update(products_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  private
  def products_params
    params.require(:products).permit(:title,:text)
  end
end
