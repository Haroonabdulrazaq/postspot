class SessionsController < ApplicationController
  def new
    @session = @user
  end
# rubocop:disable Style/SafeNavigation
  def create
    @user = User.find_by(name: params[:session][:name])

    if @user&.@user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome! #{@user.name}, you have signed in sucessfully"
      redirect_to root_path
    else
      flash.now[:alert] = 'User does not exist, Sign up Please!!!'
      render :new
    end
  end
# rubocop:enable Style/SafeNavigation
  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = 'Signed Out Sucessfully'
    redirect_to root_path
  end
end
