class SessionsController < ApplicationController
    def new
      @session = @user
    end

    def create
      @user = User.find_by(name: params[:session][:name])

      if @user
        session[:user_id] = @user.id 
        flash[:success] = "Signed In Sucessfully" 
        redirect_to users_path
      else
        flash.now[:alert] = 'User does not exist, Sign up Please!!!'
        render :new
      end
    end

    def destroy
      session.clear
      flash.now[:alert] = 'Signed Out Sucessfully'
      redirect_to user_path
    end
end
