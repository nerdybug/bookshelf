class BooksController < ApplicationController
    include UsersHelper
    before_action :logged_in?
    
    def new
        @book = Book.new
    end

    def create
        current_user
        @book = Book.create(book_params.except(:author))
        @author = Author.create(name: book_params[:author])
        @book.update(author_id: @author.id, user_id: @user.id)
        redirect_to book_path(@book)
    end

    def show
        @book = Book.find(params[:id])
        current_user
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :pub_year, :note, :favorite)
    end
end
