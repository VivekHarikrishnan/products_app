class BooksController < ApplicationController
	def new		
		@book = Book.new
	end

	def create
		@book = Book.new(params[:book])

		if @book.save
			flash[:notice] = "Successfully created a Book"
			render js: "window.location.pathname='#{product_list_path}'"
		else
			render :new
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])

	    if @book.update_attributes(params[:book])	      
	      flash[:success] = "Book details updated"
	      redirect_to product_list_path
	    else
	      render 'edit'
	    end
	end

  	def destroy
	    book = Book.find(params[:id])
	    product = Product.find_by_item_id_and_type(book.id, "Book")
	    Product.delete(product.id)
	    book.destroy

	    flash[:success] = "Book is destroyed."
	    redirect_to product_list_path
  	end
end
