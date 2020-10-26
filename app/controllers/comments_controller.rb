class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order('created_at DESC')
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.name = current_user.name
    if @comment.save
      redirect_to article_path(params[:article_id])
      flash[:notice] = 'Comment was successfully created.'
    else
      redirect_to article_path(params[:article_id]), alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
end
