class UsersController < ApplicationController
 before_action :authenticate_user!


 def index
  @users = User.all
  @books = Book.all
  @book = Book.new
  @user = current_user
 end

 def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
 end

 def edit
  @user = User.find(params[:id])
  if @user.id == current_user.id
  render :edit
  else
  redirect_to user_path(current_user.id)
  end
 end


 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:notice] = "You have updated user successfully."
   redirect_to user_path(user.id)
  else
   render :edit
  end
 end

 private

 def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
 end

 def correct_user
  @user = User.find(params[:id])
  redirect_to(root_path) unless @user == correct_user
 end

 def book_params
  params.require(:book).permit(:title, :body)
 end
end