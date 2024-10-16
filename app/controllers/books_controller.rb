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
    @book = Book.new
    @user = current_user
    @books = Book.all.includes(:user)
  end 
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect to '/books'
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
  
end
