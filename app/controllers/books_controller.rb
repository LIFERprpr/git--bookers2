class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
     #<Book id: 1, title: "test", body: "test", created_at: "2021-07-28 05:03:46", updated_at: "2021-07-28 05:03:46", user_id: 1>
    @book = Book.find(params[:id])
     #<User id: 1, email: "dmmweb@gmail.com", name: "dmm", created_at: "2021-07-26 08:45:07", updated_at: "2021-07-26 08:45:07", introduction: nil, profile_image_id: nil>
    @user = @book.user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
