class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if @item.order != nil
    
    @order_address = OrderAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private


  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(amount: @item.price, card: order_params[:token], currency: 'jpy' )
  end

end
