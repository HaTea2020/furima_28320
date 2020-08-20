class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :remove, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new(address_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def address_params
    params.permit(:postal_code,:prefecture_id,:city, :house_number,:building_name,:phone_number,:item_id).merge(user_id: current_user.id)
  end
  def order_params
    params.permit(:token)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end
  def remove
    @item = Item.find(params[:item_id])
    if @item.address&.persisted? || current_user.id == @item.user_id
      redirect_to root_path
    end
    # unless user_signed_in? && current_user.id == @item.user_id
    #   redirect_to root_path
    # end
  end
end
