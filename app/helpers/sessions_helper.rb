module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # Checks if the specified user is the logged-in user:
  def current_user?(user)
    current_user == user
  end

  # Specifies if the current user is an administrator:
  def admin_user?
    current_user.admin
  end

  # Specifies if the user is currently logged-in:
  def signed_in?
    !current_user.nil?
  end

  # Stores the user's requested destination before requiring login:
  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end

  # Restores the user's last requested destination, or points to a default:
  def restore_location_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  # 
  def require_signin
    unless signed_in?
      store_location
      flash[:notice] = "Please log in to continue."
      redirect_to signin_path
    end
  end
end
