class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: 'wxw', password: 'secret', only: :destroy
  def create
    @product = Products.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Products.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
