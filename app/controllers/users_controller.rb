class UsersController < ApplicationController

  def index
  end

  def show
    #<User id: 1, email: "dmmweb@gmail.com", name: "dmm", created_at: "2021-07-26 08:45:07", updated_at: "2021-07-26 08:45:07", introduction: nil, profile_image_id: nil>
    @user = User.find(params[:id])
    #<ActiveRecord::Associations::CollectionProxy [#<Book id: 1, title: "test", body: "test", created_at: "2021-07-28 05:03:46", updated_at: "2021-07-28 05:03:46", user_id: 1>]>
    @books = @user.books
    @book = Book.new
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
