class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(address_params)
    if @order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def address_params
    params.require(:order).permit(:user_id, :item_id)
  end


end