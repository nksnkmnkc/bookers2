class BooksController < ApplicationController

 def new
  @book = Book.new
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book)
  else
   @user = current_user
   @books = Book.all
   render :index
  end
 end

 def index
  @user = current_user
  @books = Book.all
  @book = Book.new
 end

 def show
  @book = Book.find(params[:id])
  @books = Book.new
  @user = @book.user
 end

 def edit
  @book = Book.find(params[:id])
  if @book.user == current_user
   render "edit"
  else
   redirect_to books_path
  end
 end

 def update
  @book = Book.find(params[:id])
  @book.user.id == current_user.id
  if @book.update(book_params)
   flash[:notice] = "You have update book successfully."
   redirect_to book_path
  else
   render :edit
  end
 end

 def destroy
  @book = Book.find(params[:id])
  if @book.destroy
  redirect_to books_path
  end
 end

 private

 def book_params
  params.require(:book).permit(:title, :body)
 end

end
