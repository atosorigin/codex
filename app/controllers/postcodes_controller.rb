class PostcodesController < ApplicationController

  def index
    render :file => "postcodes/index.xml.erb"
  end

  def show
    render :file => "postcodes/show.xml.erb"
  end

  def products
    render :file => "postcodes/products.xml.erb"
  end
end
