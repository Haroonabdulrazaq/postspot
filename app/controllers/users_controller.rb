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
        redirect_to user_path
      end
    end       
end
