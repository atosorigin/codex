class ConsignmentsController < ApplicationController

  def index
    render :file => "consignments/index.xml.erb"
  end

  def show
    render :file => "consignments/show.xml.erb"
  end

end
