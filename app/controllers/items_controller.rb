class ItemsController < ApplicationController
  def index
  end

  def create
  end

  def new
    Item.create(item.params)
    redirect_to '/'
    redirect_to root_path
  end

  def show
  end

  def edit
  end
end
