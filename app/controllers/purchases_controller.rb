class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]
  before_action :find_product, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)

    if @purchase_address.valid?
      pay_purcahse
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end

    
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:postal, :prefecture_id, :city, :house_number, :building, :phone).merge(token: params[:token], product_id: params[:product_id],purchase_id: params[:purchase_id],user_id: current_user.id)
  end

  def move_to_root
    @product = Product.find(params[:product_id])
    if current_user.id == @product.user_id || @product.purchase.present?
      redirect_to root_path
    end
  end

  def pay_purcahse
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Product.find(params[:product_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def find_product
    @product = Product.find(params[:product_id])
  end


end
