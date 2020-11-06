class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
      @Product = Product.new
    else
      redirect_to new_user_session_path
    end
  end

  def create(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:image, :user_id, :name, :explanation, :category_id, :condition_id, :postage_id, :source_id, :shipping_day_id, :price)
  end
end
