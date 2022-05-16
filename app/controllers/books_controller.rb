class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = current_user
    @book_new = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
    
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book)
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
