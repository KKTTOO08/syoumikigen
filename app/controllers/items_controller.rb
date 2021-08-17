class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  before_action :kariitem
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_path
    else
      @items = current_user.items.sort_by {|item| item.zanbi.to_i}
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = '削除しました'
    redirect_to root_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :syumoku_id)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_path
    end
  end
  
  def kariitem
    current_user.items.each do |item|
      item.generate_zanbi
    end
  end
  
end
