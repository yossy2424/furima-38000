class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user! 
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchase = Purchase.new
    @purchase_address = PurchaseAddress.new	
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :phone_number, :building, :price, :address).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def prevent_url
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item[:price],  # 商品の値段
    card: purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end
end
