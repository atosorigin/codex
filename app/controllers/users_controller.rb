class UsersController < ApplicationController

  def index
    render :file => "users/index.xml.erb"
  end

  def show
    render :file => "users/show.xml.erb"
  end

end
