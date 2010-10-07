class AccountsController < ApplicationController
  
  def new
    @account = Account.new()
  end

  def index
    render :file => "accounts/index.xml.erb"
  end

  def show 
    @account = Account.find_by_name(params[:account_name])
    render :file => "accounts/show.xml.erb"
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      flash[:notice] = 'Account successfully created.'
      #redirect_to "/accounts/" + @account.name
      redirect_to "/accounts/" + @account.name
    else
      render :action => "new"
    end
  end

end
