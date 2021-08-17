class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  before_action :kariitem
  
  def index
    if logged_in?
      @item = current_user.items.build 
      
      @items = current_user.items.sort_by {|item| item.zanbi.to_i}
      #.order(id: :desc)
    end
  end
  
  private
  
  def kariitem
    current_user.items.each do |item|
      item.generate_zanbi
    end
  end
  
end