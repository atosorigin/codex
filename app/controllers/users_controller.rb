class UsersController < ApplicationController

  def index
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account"
    else
      @users = @account.users
    end
    render :file => "users/index.xml.erb"
  end

  def show
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account"
    else
      @user = @account.users.find_by_username(params[:username])
      if @user.nil?
        raise ErrorHttp_404, "Cannot find the user :" +params[:username] + " for account " + @account.name
      else
        render :file => "users/show.xml.erb"
      end
    end
  end

end
