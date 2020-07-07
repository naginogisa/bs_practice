class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def new

  end 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render 'index'
    end
  end
  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end
  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @newbook = Book.new
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])  
    if  @book.user == current_user
      render 'edit'
     else 
      redirect_to books_path
     end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
   
    redirect_to book_path(@book), notice: "Book was successfully updated."
    else
    render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
      redirect_to books_path(@books)
  
  end

  private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
