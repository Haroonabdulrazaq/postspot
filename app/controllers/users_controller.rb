class UsersController < ApplicationController
  before_action :set_user, only: [:show]
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
      redirect_to signin_path
    else
      flash.now[:alert] = 'Can not sign up for some reasons'
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
