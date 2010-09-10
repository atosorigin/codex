class ProductsController < ApplicationController

  def index
    render :file => "products/index.xml.erb"
  end

  def show
    render :file => "products/show.xml.erb"
  end

end
