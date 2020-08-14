class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show]
  def index
    @item = Item.includes(:user).order("created_at DESC")
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
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:genre_id,:statue_id,:fee_id,:prefecture_id,:days_id,:price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
