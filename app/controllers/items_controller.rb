class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit] # , :destroy
  # before_action :redirect_if_not_owner, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      puts @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def sold?
    order.present?
  end

  def edit
  end

  def update
    # if @item.update(item_params)
    #  redirect_to item_path(@item), notice: '商品情報が更新されました。'
    # else
    #  render :edit, status: :unprocessable_entity
    # end
  end

  def destroy
    # if @item.destroy
    #  redirect_to items_path, notice: '商品を削除しました'
    # else
    #  redirect_to item_path(@item), alert: '商品を削除できませんでした'
    # end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path, alert: '商品が見つかりません。' if @item.nil?
  end

  # def redirect_if_not_owner
  #    redirect_to root_path, alert: '他のユーザーの商品は編集できません。' if @item.user_id != current_user.id
  # end

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :condition_id,
      :shipping_cost_id, :prefecture_id, :shipping_time_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end
