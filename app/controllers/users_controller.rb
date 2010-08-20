class UsersController < ApplicationController
  before_filter :find_user,
    :only => [:show, :edit, :update, :destroy]

  def index

  end

  def show
  end

  def new

  end

  def edit
  end

  def create

  end

end
