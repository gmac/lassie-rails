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

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    num_admins = User.where(admin: true).count

    if num_admins <= 1 && user_params[:admin] != "1"
      flash[:error] = 'Cannot modify final admin user.'
      redirect_to edit_user_path(@user)
    elsif @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    num_admins = User.where(admin: true).count

    if num_admins <= 1
      flash[:error] = 'Cannot delete final admin user.'
      redirect_to edit_user_path(@user)
    else
      @user.destroy
      redirect_to users_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :admin
    )
  end
end
