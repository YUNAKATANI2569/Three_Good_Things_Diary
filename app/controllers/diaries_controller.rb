class DiariesController < ApplicationController

  def index
  @diary = Diary.all
  end

  def new
  @diary = Diary.new
  end

  def create
  diary = Diary.new(diary_params)
  diary.save
  redirect_to request.referer
  end

  def show
  @diary = Diary.find(params[:id])
  @comment = Comment.new
  end


  def edit
  @diary = Diary.find(params[:id])
  end

  def update
  @diary = Diary.find(params[:id])
  Diary.update(Diary_params)
  redirect_to request.referer
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diary_path
  end



  private

  def diary_params
    params.require(:diary).permit(:body)
  end

end
