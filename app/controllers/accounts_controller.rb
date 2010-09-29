class AccountsController < ApplicationController
  def index
    render :file => "accounts/index.xml.erb"
  end

  def show
    render :file => "accounts/show.xml.erb"
  end
end
