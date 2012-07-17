class SongsController < ApplicationController
	def new		
		@song = Song.new
	end

	def create
		@song = Song.new(params[:song])

		if @song.save
			flash[:notice] = "Successfully created a Song"
			render js: "window.location.pathname='#{product_list_path}'"
		else
			render :new
		end
	end	

	def show
		@song = Song.find(params[:id])
	end

    def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])

	    if @song.update_attributes(params[:song])	      
	      flash[:success] = "song details updated"
	      redirect_to product_list_path
	    else
	      render 'edit'
	    end
	end

 	def destroy
	    song = Song.find(params[:id])
	    product = Product.find_by_item_id_and_type(song.id, "Song") 	
	    Product.delete(product.id)
	    song.destroy

	    flash[:success] = "Song is destroyed."
	    redirect_to product_list_path
  	end	
end
