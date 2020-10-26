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
