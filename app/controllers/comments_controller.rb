class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy, :update, :index]

  def index
    comments = Comment.all
    render json: comments
  end 

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end 

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: {message: 'this comment was deleted'}
  end

  def create
    comment = Comment.create(comment_params)
    render json: comment 
  end 

  def update 
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    render json: comment 
  end 

  private 

  def comment_params
    params.require(:comment).permit(:study_group_id, :user_id, :comment)
  end
end
