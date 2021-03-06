class PagesController < ApplicationController
	before_action :authenticate_book!, except: [:show]
	before_action :require_permission
	before_action :find_book
	before_action :find_page, only: [:show, :edit, :update, :destroy]

	def new
		@page = @book.pages.new
	end

	def create
		@page = @book.pages.new(page_params)
		if @page.save
			redirect_to root_path
		else
			render 'new'
		end
	end
 
	def show
		@pages = Page.where(book_id: @book).order(:id).paginate(:page => params[:page], :per_page => 3)
	end

	def edit
		
	end

	def update
		if @page.update page_params
			redirect_to book_page_path(@book, @page), notice: "Page was succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@page.destroy
		redirect_to root_path
	end

private

	def page_params
		params.require(:page).permit(:description, :thumbnail, :id)
	end

	def find_book
		@book = Book.find(params[:book_id])
	end

	def find_page
		@page = Page.find(params[:id])
	end

	def require_permission
		@book =Book.find(params[:book_id])
		if current_book != @book
			redirect_to root_path, notice: "Sorry, you're not allow to view that page."
		end
	end
end
