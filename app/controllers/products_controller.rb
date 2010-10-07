class ProductsController < ApplicationController

  def index
    @gazetteer_products = YodelGazetteer.new().get_products()
  end

  def show
    @product = Product.new :name => params[:product_name]
    @gazetteer_product = YodelGazetteer.new().get_product_information_by_description(@product.name)
  end

  def postcodes
    @product = Product.new :name => params[:product_name]
    render :file => "products/postcodes.xml.erb"
  end

end
