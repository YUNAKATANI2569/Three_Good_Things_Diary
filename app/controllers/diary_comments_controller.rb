class DiaryCommentsController < ApplicationController

def create
    diary = Diary.find(params[:diary_id])
    comment = current_user.diary_comments.new(comment_params)
    comment.diary_id = diary.id
    comment.save
    redirect_to request.referer
end

  def destroy
   DiaryComment.find_by(id: params[:id],diary_id: params[:diary_id]).destroy
    redirect_to request.referer

  end

   private
  def comment_params
    params.require(:diary_comment).permit(:comment)
  end
end
