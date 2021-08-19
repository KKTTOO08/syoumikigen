class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @item = current_user.items.build
      
      @items = current_user.items.order(id: :desc).each{|i| i.generate_zanbi }.sort_by{|item| item.zanbi.to_i}
    end
  end
  
end