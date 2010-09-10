class UsersController < ApplicationController

  def index
    
    render :file => "users/index.xml.erb"

  end

  def show

  end

end
