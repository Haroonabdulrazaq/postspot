class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.Comment.build(comments_params)
        if @comment.save
            flash[:notice] = 'Comments created sucessfully'
            redirect_to article_path
        else
            flash.now[:alert] = 'Comments not be created for some reasons'
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment.update(comments_params)
        if @comments.save
            flash[:notice] = 'Updated sucessfully'
            redirect_to article_path
        else
          flash.now[:alert] = 'Update not sucessfull'
          render :new
        end
    end
end
