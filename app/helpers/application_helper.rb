module ApplicationHelper
    def logged_in_user
        if session[:user_id].present?
            User.find_by_id(session[:user_id]).name.to_s
        else
            'Welcome'
        end
    end

    def voted_user
      if Vote.find_by(user_id: session[:user_id], article_id: @article.id).present?
        link_to 'Upvoted'
      else
        link_to 'Upvote', votes_article_path
      end
    end

    def vote_count
      @popular = @article.votes.group(:article_id).count
      @popular = @popular.each do |key, value|
        return value
      end
    end
end
