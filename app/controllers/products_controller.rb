class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :move_to_root, only: [:edit]
  before_action :product_find, only: [:edit, :update, :show, :destroy]


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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user_id
      if @product.destroy
        redirect_to root_path
      end
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :user_id, :name, :explanation, :category_id, :condition_id, :postage_id, :source_id, :shipping_day_id, :price).
           merge(user_id: current_user.id)
  end

  def move_to_root
    @product = Product.find(params[:id])
    if current_user.id != @product.user_id || @product.purchase.present?
      redirect_to root_path
    end
  end

  def product_find
    @product = Product.find(params[:id])
  end
end
