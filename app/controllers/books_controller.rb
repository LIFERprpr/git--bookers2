class BooksController < ApplicationController
  before_action :check_user, {only: :edit}

  def index
    @books = Book.all
    @book = Book.new
    @user =current_user
    

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render "index"

    end

  end

  def show
    @book_new = Book.new
    
     #<Book id: 1, title: "test", body: "test", created_at: "2021-07-28 05:03:46", updated_at: "2021-07-28 05:03:46", user_id: 1>
    @book = Book.find(params[:id])
     #<User id: 1, email: "dmmweb@gmail.com", name: "dmm", created_at: "2021-07-26 08:45:07", updated_at: "2021-07-26 08:45:07", introduction: nil, profile_image_id: nil>
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render "edit"
      
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
  
  def check_user
    book = Book.find(params[:id])
    if book.user_id != current_user.id
      redirect_to books_path
    end
  end
  
end
