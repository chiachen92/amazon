class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    review_params = params.require(:review).permit(:body, :star_count)
    @review = Review.new review_params
    @review.product = @product
    @review.user_id = session[:user_id]
    if @review.save
      redirect_to product_path(@product), notice: "Review created!"
    else
      flash[:alert] = "Please fix errors."
      render "/products/show"
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product), notice: "Review Deleted."
  end

end
