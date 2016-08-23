class CategoriesController < ApplicationController

  def create
    @category = Category.find params[:category]
  end


  # def create
  #   @product = Product.find params[:product_id]
  #   review_params = params.require(:review).permit(:body, :star_count)
  #   @review = Review.new review_params
  #   @review.product = @product
  #   if @review.save
  #     redirect_to product_path(@product), notice: "Review created!"
  #   else
  #     flash[:alert] = "Please fix errors."
  #     render "/products/show"
  #   end
  # end


end
