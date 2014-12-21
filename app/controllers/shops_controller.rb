class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]

  def index
    @shops = Shop.all
  end

  def show
    @shop_books = ShopBook.show_shop @shop.id
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end
end
