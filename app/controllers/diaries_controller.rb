class DiariesController < ApplicationController



  def new
   @diary = Diary.new
  end

  def create
   @diary = current_user.diaries.new(diary_params)
   @diary.start_time = DateTime.now
   if @diary.save
      redirect_to user_path(current_user.id)
   else
      render action: :new
   end
  end

  def show
   @diary = Diary.find(params[:id])
   @diary_comment = DiaryComment.new
  end


  def edit
   @diary = Diary.find(params[:id])
   if current_user.id !=  @diary.user_id
    redirect_to diary_path(@diary)
   end
  end

  def update
   @diary = Diary.find(params[:id])
   if @diary.update(diary_params)
      redirect_to diary_path(@diary), notice: "更新に成功しました。"
   else
      render "edit"
   end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to user_path(current_user.id)
  end



  private

  def diary_params
    params.require(:diary).permit(:body)
  end

end
