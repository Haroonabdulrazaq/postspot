class UsersController < ApplicationController  
    def index 
      @users = User.all 
    end

    def new 
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Signed up sucessfully'
        redirect_to users_path
      else
        flash[:alert] = 'Can not sign up for some reasons'
        render :new
      end
    end       
end
