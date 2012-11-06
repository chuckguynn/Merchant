class OrdersController < ApplicationController
  

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    session[:order_id] = nil
    redirect_to products_path, :notice => "Created a New Order"
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to @order, :notice  => "Successfully updated order."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if current_user 
      @order.order_items.destroy_all
    else
    @order.destroy
  end
    redirect_to products_url, :notice => "Successfully Emptied Cart."
  end

  def purchase
    @order = Order.find(params[:id])
    @order.update_attributes(params[:address])
    @order.save
    session[:order_id] = nil
    redirect_to sessions_url
  end
end
