class Api::V1::UserStocksController < ApplicationController

  def index 
    render json: UserStock.all
  end 

  def show
    @user_stock = UserStock.find(params[:id])
    render json: @user_stock
  end

  def new 
    @user_stock = UserStock.new
  end 

  def create
    # byebug
    stock = Stock.find_or_create_by(name: params[:name], ticker: params[:ticker])
    user = get_current_user
    user_stock_found = UserStock.find_by(stock_id: stock.id, user_id: user.id)
    if user_stock_found 
      render json: {error: 'You have already added this stock'}
    else 
      user_stock = UserStock.find_or_create_by(stock_id: stock.id, user_id: user.id)
      # byebug
      render json: [user_stock], serializer: UserStockSerializer
    end 
  end

  def destroy 
    # @stock = Stock.find(params[:id])
    @user = get_current_user
    @user_stock_found = UserStock.find_by(stock_id: params[:id], user_id: @user.id)
    if @user_stock_found.notes  
      @user_stock_found.notes.destroy_all
    end 
    if @user_stock_found
      @user_stock_found.destroy
     render json: {status: 200 }
    end 
  end 

end

# {
#   id: user_stock.id,
#   name: user_stock.stock.name,
#   stockNotes: user_stock.stock.notes
# }
