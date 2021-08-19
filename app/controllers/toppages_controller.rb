class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  #before_action :kariitem
  
  def index
    if logged_in?
      @item = current_user.items.build
      
      #modelに記載した方が良さそう
      @items = current_user.items.order(id: :desc).each{|i| i.generate_zanbi }.sort_by{|item| item.zanbi.to_i}
      #@items = items.each{|i| i.generate_zanbi }.sort_by{|item| item.zanbi.to_i}
      #sort_by {|item| item.zanbi.to_i}
      #
    end
  end
  
  private
  
  #def kariitem
    #current_user.items.each do |item|
      #item.generate_zanbi
    #end
  #end
  
end