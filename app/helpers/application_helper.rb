module ApplicationHelper
    def logged_in_user
        if session[:user_id].present?
            User.find_by_id(session[:user_id]).name.to_s
        else
            'Welcome'
        end
    end
end
