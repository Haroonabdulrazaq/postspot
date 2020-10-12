class ApplicationController < ActionController::Base
    def user_params
        params.require(:user).permit(:name)
    end

    def current_user
        return unless session[:user_id]

        @current_user ||= User.find(session[:user_id])
    end
end
