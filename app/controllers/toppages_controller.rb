class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @item = current_user.items.build
      #並び替え要工夫
      Item.generate_zanbi
      @items = current_user.items.order(zanbi: :ASC)
    end
  end
end