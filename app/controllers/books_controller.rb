class BooksController < ApplicationController
    def index
        if params[:user_id]
            @books = User.find(params[:user_id]).books
            flash.now[:danger] = "Add a new book to get started!" if @books.empty?
        end
    end

    def new
        @book = Book.new
        @book.reviews.build
    end

    def create
        @book = Book.create(book_params)
        @book.reviews.last.user = current_user
        if @book.save
          redirect_to @book
        else
          render :new
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    private

    def book_params
        params.require(:book).permit(:title, :author_first, :author_last, :genre_id, reviews_attributes: [:content])
    end
end
