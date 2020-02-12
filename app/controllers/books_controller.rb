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
          # If the book is invalid, hold on to @book, because it is now full of
          # useful error messages, and re-render the :new page, which knows how
          # to display them alongside the user's entries.
          render :new
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    private

    # tells Rails which parameters are allowed to be submitted
    # through the form to the database
    def book_params
        params.require(:book).permit(:title, :author_first, :author_last, :genre_id, reviews_attributes: [:content])
    end
end
