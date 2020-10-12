class ArticlesController < ApplicationController
    def index 
      @article = Article.all
    end

    def new 
      @article = Article.new
    end

    def create 
      @article = current_user.build(article_params)
    end
end
