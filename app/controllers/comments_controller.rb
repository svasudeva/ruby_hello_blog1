class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create! comments_params
    CommentsMailer.submitted(@comment).deliver_later
    CommentsChannel.broadcast(@comment)
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment Post was successfully created.' } if @comment.save
    end
  end

private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.required(:comment).permit(:body)
  end
end
