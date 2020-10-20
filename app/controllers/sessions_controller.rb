# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @session = @user
  end

  def create
    @user = User.find_by(name: params[:session][:name])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Signed In Sucessfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'User does not exist, Sign up Please!!!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = 'Signed Out Sucessfully'
    redirect_to root_path
  end
end
