
class BooksController < ApplicationController
    before_action :logged_in?
    before_action :current_book, only: [:show, :edit, :update, :destroy]
    
    def new
        @book = Book.new
    end

    def create
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
    end

    def show
    end

    def edit
        @author = @book.author
    end
    
    def update
        @author = Author.find_or_create_by(name: book_params[:author])
        @book.update(book_params.except(:author))

        if !@book.errors.empty? || !@author.errors.empty?
            render :action => 'edit'
        elsif @book.author_id != @author.id
            @book.update(author_id: @author.id)
            redirect_to user_book_path(@user, @book)
        else
            redirect_to user_book_path(@user, @book)
        end
    end

    def most_recent_book
        @book = current_user.most_recent_book
        render :action => 'show'
    end

    def destroy
        @book.destroy
        redirect_to user_books_path(@user)
    end
    
    private

    def book_params
        params.require(:book).permit(:title, :author, :pub_year, :note, :favorite)
    end


end
