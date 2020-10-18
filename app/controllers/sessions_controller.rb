class SessionsController < ApplicationController
    def new
      @session = @user
    end

    def create
      @user = User.find_by(name: params[:session][:name])

      if @user
        session[:user_id] = @user.id 
        flash[:notice] = "Signed In Sucessfully" 
        redirect_to root_path
      else
        flash.now[:alert] = 'User does not exist, Sign up Please!!!'
        render :new
      end
    end

    def destroy
      log_out
    end
end
