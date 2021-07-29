class BooksController < ApplicationController

 def index
  @books = Book.all
  @new_book = Book.new
  @user = current_user
 end

 def new
  @new_book = Book.new
 end

 def show
  @book = Book.find(params[:id])
  @user = @book.user
  @new_book = Book.new
 end

 def create
  @new_book = Book.new(book_params)
  @new_book.user_id = current_user.id
  if @new_book.save
    redirect_to book_path(@new_book), notice: "You have creted book successfully."
  else
    @books = Book.all
    @user = current_user
    render :index
  end
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
  if @book.update(book_params)
   redirect_to book_path(@book), notice: "You have updated book successfully."
  else
   render :edit
  end
 end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
 end

 private
 def book_params
  params.require(:book).permit(:title, :body)
 end

end
