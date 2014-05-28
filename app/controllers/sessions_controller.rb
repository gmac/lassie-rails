class SessionsController < ApplicationController
  layout 'editor'
  
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      restore_location_or root_path
    else
      @user = User.new
      flash.now[:error] = 'Invalid email/password combination'
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

end
