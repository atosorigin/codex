class LocationsController < ApplicationController

  def index
    render :file => "locations/index.xml.erb"
  end

  def show
    render :file => "locations/show.xml.erb"
  end

  def manifest
    render :file => "locations/manifest.xml.erb"
  end

end
