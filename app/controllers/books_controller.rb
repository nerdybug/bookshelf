class BooksController < ApplicationController
    include UsersHelper
    before_action :logged_in?

    def new
        @book = Book.new
    end

    def create
        current_user
        @book = Book.create(book_params.except(:author))
        @author = Author.find_or_create_by(name: book_params[:author])
        @book.update(author_id: @author.id, user_id: @user.id)
        if @book.save
            redirect_to user_book_path(@user, @book)
        else
            render 'new'
        end
    end

    def index
        current_user
    end

    def show
        current_book
        current_user
    end

    def edit
        current_book
    end
    
    def update
        current_book
        @author = Author.find_or_create_by(name: book_params[:author])
        @book.update(book_params.except(:author))
        if @book.author_id != @author.id
            @book.update(author_id: @author.id)
        end
        redirect_to user_book_path(@user, @book)
    end

    def destroy
        current_book
        current_user
        @book.destroy

        redirect_to user_books_path(@user)
    end
    
    private

    def book_params
        params.require(:book).permit(:title, :author, :pub_year, :note, :favorite)
    end

    def current_book
        @book = Book.find(params[:id])
    end
end
