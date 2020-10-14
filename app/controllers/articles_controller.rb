class ArticlesController < ApplicationController
    def index 
      @articles = Article.all
    end

    def new 
      @article = Article.new
    end

    def create 
      @article = current_user.articles.build(article_params)

      if @article.save
        flash[:notice] = 'Article created Sucessfully'
        redirect_to articles_path
      else
        flash.now[:alert] = 'Article not created for some reasons'
        render :new
      end
    end

    def show
      @article = Article.find(params[:id])
    end

    def votes
      @vote = Vote.create(user_id: session[:user_id], article_id: params[:id] )

      if @vote.save
        flash[:notice] = 'Upvoted Sucessfully'
        redirect_to articles_path
      else
        flash.now[:alert] = 'Can not upvote this article'
        render :show
      end
    end
end
