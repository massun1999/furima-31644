class PurchasesController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new
  end


  def create
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new(purchase_params)

    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Product.find(params[:product_id]).price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save(purchase_params)
      redirect_to root_path
    else
      render action: :index
    end
    
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:postal, :prefecture_id, :city, :house_number, :building, :phone).merge(token: params[:token], product_id: params[:product_id],purchase_id: params[:purchase_id],user_id: current_user.id)
  end

end
