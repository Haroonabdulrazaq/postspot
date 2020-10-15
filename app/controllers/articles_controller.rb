class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
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
    end

    def edit   
    end

    def update
       respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
       end
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


    private

    def set_article
      @article = Article.find(params[:id])
    end
end
