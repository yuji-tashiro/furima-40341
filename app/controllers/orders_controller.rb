class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
                              .merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
