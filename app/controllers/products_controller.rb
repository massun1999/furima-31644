class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @Product = Product.new
  end
end
