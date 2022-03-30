class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
    @books = @user.books
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @books = @user.books
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to user_path(@user.id)
    else
      render :"/users/show"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
