class OrderItemsController < ApplicationController
  before_filter :load_order




 def create
    @order_item = @order.order_items.find_or_initialize_by_product_id(params[:product_id])
    @order_item.quantity += 1 
    unless @order_item.new_record?
        
    end
          
    if @order_item.save
        redirect_to @order, :notice => "Successfully created order item."
      else
        render :action => 'new'
      end
    end


  def edit
    @order_item = OrderItem.find(params[:id])
  end

   def update
      @order_item = OrderItem.find(params[:id])
      if params[:order_item][:quantity].to_i == 0
        @order_item.destroy
        redirect_to @order, :notice  => "Item was removed"
      elsif
        @order_item.update_attributes(params[:order_item])
        redirect_to @order, :notice => "Successfully updated the order item"
      else
        redirect_to @order_item
      end
    end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order, :notice => "Successfully destroyed order item."
  end
end
