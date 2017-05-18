class PagesController < ApplicationController
before_action :find_book
before_action :find_page, only: [:show, :edit, :update, :destroy]

	def new
		@page = @book.pages.new
	end

	def create
		@page = @book.pages.new(page_params)
		if @page.save
			redirect_to book_page_path(@book, @page)
		else
			render 'new'
		end
	end

	def show
		@pages = Page.where(book_id: @book).order("created_at DESC").reject { |e| e.id == @page.id}
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
		params.require(:page).permit(:description)
	end

	def find_book
		@book = Book.find(params[:book_id])
	end

	def find_page
		@page = Page.find(params[:id])
	end
end
