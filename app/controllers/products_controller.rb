class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def pages
    # if params[:page] != '-1'
    @page = params[:page].to_i
    @show_products = Product.offset(@page*10).limit(10)
    # else
    # @show_products = Product.limit(10)
    # end
  end

  def index
    @products = Product.order(id: :DESC)
    @category = Category.all
  end

  def new
    @category = Category.new
    @product = Product.new
  end

  def create

    @price = params[:price]
    product_params = params.require(:product).permit([:title, :description, :price, :category_id])

    @product = Product.create product_params
    @category = @product.category_id(params[:id])

    @product.user_id = session[:user_id]
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
    @review = Review.new
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.all
  end

  def update
    @product = Product.find(params[:id])
    @categories = Category.
    @product.category_id = params[:category_id]

    if @product.update(params.require(:product).permit([:title, :description, :price, :category_id]))
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
end
