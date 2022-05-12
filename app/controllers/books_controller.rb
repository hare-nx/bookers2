class BooksController < ApplicationController

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      @user=User.find_by(id: current_user.id)
      render :index
    end
  end

  def index
    @user=User.find_by(id: current_user.id)
    @book=Book.new
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
