class PurchasesController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
  end


  def create
    binding.pry
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
    
  end


  private

  def purchase_params
    params.permit(:postal, :city, :house_number, :building, :phone)
  end

end
