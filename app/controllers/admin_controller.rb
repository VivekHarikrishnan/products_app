class AdminController < ApplicationController
  def index
  	@products = Product.paginate(page: params[:page], per_page: 10)
  end

  def home
  end

  def new
  	item_class = params[:item_class]

  	case item_class
	  	when "Book"
	  		@item_form = "admin/create_book_form"
	  		@book = Book.new
	  	when "Camera"
	  		@item_form = "admin/create_camera_form"
	  		@camera = Camera.new
	  	when "Song"
	  		@item_form = "admin/create_song_form"
	  		@song = Song.new
  	end

  	respond_to do |format|  		
  		format.js {render layout: false}
  	end
  end

  def create  	
  end
end
