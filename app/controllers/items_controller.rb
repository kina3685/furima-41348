class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new, status: :unprocessable_entity # Turboが適切に処理できるようにステータスコードを指定
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :condition_id,
      :shipping_cost_id, :prefecture_id, :shipping_time_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end
