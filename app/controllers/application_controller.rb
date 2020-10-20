class ApplicationController < ActionController::Base
  helper_method :current_user
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def article_params
    params.require(:article).permit(:title, :image, :text, :category_id)
  end

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
