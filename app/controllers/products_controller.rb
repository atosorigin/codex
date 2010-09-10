class ProductsController < ApplicationController

  def index

    render :file => "products/index.xml.erb"

  end

  def show

  end

end
