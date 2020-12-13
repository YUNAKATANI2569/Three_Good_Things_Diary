class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

  def index
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id

    redirect_to user_path(current_user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
       @books = @user.books
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end

