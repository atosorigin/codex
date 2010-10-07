class AccountsController < ApplicationController
  
  def new
    @account = Account.new()
  end

  def index
    render :file => "accounts/index.xml.erb"
  end

  def show 
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      render :file => "shared/404.html.erb", :status=>404
    else
      render :file => "accounts/show.xml.erb"
    end
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      redirect_to "/accounts/" + @account.name
    else
      render :action => "new"
    end
  end

end
