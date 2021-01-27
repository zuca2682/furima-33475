class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to action: :index
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to item_path(item)
    else
      @item = item
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :state_id, :burden_id, :area_id, :delivery_id,
                                 :price).merge(user_id: current_user.id)
  end
end
