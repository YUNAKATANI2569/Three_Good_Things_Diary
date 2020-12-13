class CommentsController < ApplicationController

  def create
    @diary = Diary.find(params[:diary_id])
    comment = current_user.comments.new(comment_params)
    comment.post_image_id = diary
    comment.save
    redirect_to request.referer

  end

  def destroy
    Comment.find_by(id: params[:id], post_image_id: params[:diary_id]).destroy
    redirect_to equest.referer
  end

   private
  def comment_params
    params.require(:comment).permit(:diary_comments)
  end


end
