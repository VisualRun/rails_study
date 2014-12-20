class ProductsController < ApplicationController

  def index
    @product = Products.all
  end

  def new
    @product = Products.new
  end

  def create
    #render plain: params[:products].inspect
    @product = Products.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = Products.find(params[:id])
  end

  def edit
    @product = Products.find(params[:id])
  end

  def update
    @product = Products.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Products.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
  def product_params
    params.require(:products).permit(:title,:text)
  end
end
