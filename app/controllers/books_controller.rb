class BooksController < ApplicationController

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params.except(:author))
        @author = Author.create(name: book_params[:author])
        @book.update(author_id: @author.id)
        redirect_to book_path(@book)
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :pub_year, :note, :favorite)
    end
end
