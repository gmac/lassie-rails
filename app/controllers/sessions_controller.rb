class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      restore_location_or root_url
    else
      @user = User.new
      flash.now[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

end
