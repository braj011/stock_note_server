class Api::V1::StocksController < ApplicationController

  require 'nokogiri'

  def index 
    render json: Stock.all
  end 

  def show
    stock = Stock.find(params[:id])
    render json: stock
  end

  def new
    @stock = Stock.new
  end

  def create_stock_ticker

  end 

  def create
    created_stock = Stock.find_or_create_by(name: params[:name], ticker: params[:ticker])
    render json: created_stock
  end


end
