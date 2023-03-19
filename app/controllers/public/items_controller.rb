class Public::ItemsController < ApplicationController
  def index
    @items=Items.all
  end

  def show
  end
end
