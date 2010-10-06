class ProductsController < ApplicationController

  def index
    @gazetteer_products = YodelGazetteer.new().get_products()
    respond_to do |format|
       format.html 
       format.xml { render :xml=>@gazetteer_products } 
    end
  end

  def show
    @product = Product.new :name => params[:product_name]
    @gazetteer_product = YodelGazetteer.new().get_product_information_by_description(@product.name)
    respond_to do |format|
       format.html
       format.xml { render :xml=>@gazetteer_product}
    end
 
  end

  def postcodes
    @product = Product.new :name => params[:product_name]
    render :file => "products/postcodes.xml.erb"
  end

end
