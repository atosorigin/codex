class OrdersController < ApplicationController

  def index
    render :file => "orders/index.xml.erb"
  end

  def show
    @order = Order.new :order_reference => params[:order_reference]
    render :file => "orders/show.xml.erb"
  end

end
