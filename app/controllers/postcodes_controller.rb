class PostcodesController < ApplicationController

  def index
    render :file => "postcodes/index.xml.erb"
  end

  def show
    @product = Product.new :name => params[:product_name]
    render :file => "postcodes/show.xml.erb"
  end

end
