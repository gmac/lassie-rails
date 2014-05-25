class UsersController < ApplicationController
  layout 'root'
  before_action :require_signin
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    
  end

  def destroy
    
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
