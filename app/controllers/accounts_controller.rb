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
    if @account.save && @user.save
      redirect_to "/accounts/" + @account.name
    else
      raise ErrorHttp_500, "Error createing new account, check the API documentation for codex.yodel.co.uk/accounts"
    end
  end

end
