class AccountsController < ApplicationController
  
  def new
    @account = Account.new()
  end

  def index
    @accounts = Account.all
    render :file => "accounts/index.xml.erb"

  end

  def show 
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account name"
    else
      render :file => "accounts/show.xml.erb"
    end
  end

  def create
    @account = Account.new(params[:account])
    @user = @account.users.build(params[:admin])
    @user.username = "admin"
    @user.role = "administrator"
    @location = @account.locations.build(params[:location])
    if @account.save && @user.save && @location.save
      redirect_to URI.escape("/accounts/" + @account.name)
    else
      raise ErrorHttp_500, "Error createing new account, check the API documentation for codex.yodel.co.uk/accounts"
    end
  end

end
