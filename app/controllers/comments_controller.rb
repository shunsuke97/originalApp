class CommentsController < ApplicationController
  def create
    # comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id], user_id: current_user.id)
    # redirect_to "/posts/#{comment.post.id}"
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html {redirect_to post_path(params[:post_id])}
      format.json
  end

  private
  def comment_params
    # params.permit(:text, :post_id)
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
