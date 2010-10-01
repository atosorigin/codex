class ParcelsController < ApplicationController

  def index
    render :file => "parcels/index.xml.erb"
  end

  def show
    @parcel = Parcel.new :parcel_reference => params[:parcel_reference]
    render :file => "parcels/show.xml.erb"
  end

  def label

  end

  def printed
    render :file => "parcels/printed.xml.erb"
  end

  def consignment
    render :file => "parcels/consignment.xml.erb"
  end

end
