class BooksController < ApplicationController

 def new
  @book = Book.new
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @book.save
  redirect_to books_path
 end

 def index
 end

 def show
 end

 def edit
  @book = Book.find(params[:id])
 end

 def updata
  book = Book.find(params[:id])
  book.updata(book_params)
  redirect_to book_path(book.id)
 end

 def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
 end

 private

 def book_params
  params.require(:book).permit(:title, :opinion)
 end

end