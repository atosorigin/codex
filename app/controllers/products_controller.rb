class ProductsController < ApplicationController

  def index
    render :file => "products/index.xml.erb"
  end

  def show
    @product = Product.new :name => params[:product_name]
    @gazateer_product = YodelGazetteer.new().get_product_information_by_description(@product.name)
    if @gazateer_product.nil?
      #render :text => "This should be a 404", :status => 404

      flash.now[:error] = "the product you are looking for <strong>/products/" + @product.name + "</strong>" +
        " does not exist, please look at <a href='/products'>/products</a>"
      render :file => 'shared/404.html.erb', :status => 404, :layout => true

    else
      render :file => "products/show.xml.erb"
    end
    
  end

  def postcodes
    @product = Product.new :name => params[:product_name]
    render :file => "products/postcodes.xml.erb"
  end

end
