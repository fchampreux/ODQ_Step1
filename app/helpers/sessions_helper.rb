module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_playground
    current_user.current_playground_id
  end

  def current_login
    current_user.login
  end

  def user_is_admin?
    current_user.is_admin
  end
  
  # Check for active session
  def signed_in_user
    redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
  end
  
  def set_locale
    if signed_in?
      I18n.locale = current_user.language || I18n.default_locale
    else
      I18n.locale = I18n.default_locale
    end
  end

end
