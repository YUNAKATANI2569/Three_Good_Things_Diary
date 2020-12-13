class FavoritesController < ApplicationController

  def create
   @diary = Diary.find(params[:diary_id])
    favorite = @diary.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    favorite = current_user.favorites.find_by(book_id: @diary.id)
    favorite.destroy
    redirect_to request.referer

  end

end
