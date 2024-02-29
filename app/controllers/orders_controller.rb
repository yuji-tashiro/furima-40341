class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    # 自身が出品した商品の購入ページへのアクセス、または売却済み商品の購入ページへのアクセスを防ぐ
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def order_params
    params.require(:order_form).permit(:item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
                              .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,          # 商品の値段
        card: order_params[:token],   # カードトークン
        currency: 'jpy'               # 通貨の種類（日本円）
      )
  end

end
