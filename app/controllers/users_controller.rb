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

  def create
    @account = Account.find_by_name(params[:account_name])
    @user = @account.users.build(params[:user])
    if @user.save
      redirect_to "/accounts/" + @account.name + "/users/" + @user.username
    else
      raise ErrorHttp_500, "Error createing new user check the API documentation for codex.yodel.co.uk/api"
    end
  end

  def destroy
    @account = Account.find_by_name(params[:account_name])
    if @account.nil?
      raise ErrorHttp_404, "Cannot find account"
    else
      @user = @account.users.find_by_username(params[:username])
      if @user.nil?
        raise ErrorHttp_404, "Cannot find the user :" +params[:username] + " for account " + @account.name
      else
        @user.destroy
        redirect_to "/accounts/" + @account.name + "/users"
      end
    end
  end

end
