class BooksController < ApplicationController
	def index
		@books = Book.all
  end
  def show
    id = params[:id]
    if (not Book.exists?(id))
      flash[:notice] = "Book does not exist"
      redirect_to '/books'
      return
    end
    @book = Book.find(id)
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end
  def new
  end
  def create
    @book = Book.create!(params[:book])
    flash[:notice] = "#{@book.title} was successfully created."
    redirect_to books_path
  end
end
