class PostcodesController < ApplicationController

  def index
    render :file => "postcodes/index.xml.erb"
  end

  def show
    render :file => "postcodes/show.xml.erb"
  end

  def products
    @postcode = Postcode.new :code => params[:postcode]
    @products = YodelGazetteer.new().find_products_for_postcode(@postcode.code)
    #logger.debug "message"
    #  {:gazetteer_version=>"001", :product_name=>"EXPRESS", :feature_name=>"PRIORITY 12:00", :product_code=>"01", :feature_code=>"01"},
    #raise @products.inspect
    render :file => "postcodes/products.xml.erb"
  end

end
