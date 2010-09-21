class ProductsController < ApplicationController

  def index
    render :file => "products/index.xml.erb"
  end

  def show
    @product = Product.new :name => params[:product_name]
    render :file => "products/show.xml.erb"
  end

  def postcodes
    @product = Product.new :name => params[:product_name]
    render :file => "products/postcodes.xml.erb"
  end

end
