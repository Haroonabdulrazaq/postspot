module ApplicationHelper
  def logged_in_user
    if current_user.nil?
      'Welcome'
    else
      User.find_by_id(session[:user_id]).name.to_s
    end
  end

  def voted_user
    if Vote.find_by(user_id: session[:user_id], article_id: @article.id).present?
      link_to 'Downvote', downvote_article_path
    else
      link_to 'Upvote', votes_article_path
    end
  end
end
