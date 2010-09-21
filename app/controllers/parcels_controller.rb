class ParcelsController < ApplicationController

  def index
    render :file => "parcels/index.xml.erb"
  end

  def show
    render :file => "parcels/show.xml.erb"
  end

  def label

  end
  
end
