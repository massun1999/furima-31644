class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :user_id, :name, :explanation, :category_id, :condition_id, :postage_id, :source_id, :shipping_day_id, :price).
           merge(user_id: current_user.id)
  end
end
