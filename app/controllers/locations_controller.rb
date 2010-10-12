class LocationsController < ApplicationController

  def index
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account"
    else
      @locations = @account.locations
    end
    render :file => "locations/index.xml.erb"
  end

  def show
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account"
    else
      @location = @account.locations.find_by_name(params[:location])
      if @location.nil?
        raise ErrorHttp_404, "Cannot find the location :" +params[:location] + " for account " + @account.name
      else
        render :file => "locations/show.xml.erb"
      end
    end
  end

  def create
    @account = Account.find_by_name(params[:account_name])
    @location = @account.locations.build(params[:location])
    if @location.save
      logger.debug "[info]/accounts/" + @account.name + "/locations/" + @location.name
      redirect_to URI.escape("/accounts/" + @account.name + "/locations/" + @location.name)
    else
      raise ErrorHttp_500, "Error createing new location check the API documentation for codex.yodel.co.uk/api"
    end
  end

  def destroy
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account"
    else
      @location = @account.locations.find_by_name(params[:location])
      if @location.nil?
        raise ErrorHttp_404, "Cannot find the location :" +params[:location] + " for account " + @account.name
      else
        @location.destroy
        redirect_to URI.escape("/accounts/" + @account.name + "/locations")
      end
    end
  end

  def manifest
    render :file => "locations/manifest.xml.erb"
  end

end
