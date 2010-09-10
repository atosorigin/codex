class OrdersController < ApplicationController

  def index
    render :file => "orders/index.xml.erb"
  end

  def show
    render :file => "orders/show.xml.erb"
  end

end
