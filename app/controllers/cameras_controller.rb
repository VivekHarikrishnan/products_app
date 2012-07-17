class CamerasController < ApplicationController
	def new		
		@camera = Camera.new
	end

	def create
		@camera = Camera.new(params[:camera])

		if @camera.save
			flash[:notice] = "Successfully created a Camera"
			render js: "window.location.pathname='#{product_list_path}'"
		else
			render :new
		end
	end

	def show
		@camera = Camera.find(params[:id])
	end

	def edit
		@camera = Camera.find(params[:id])
	end

	def update
		@camera = Camera.find(params[:id])

	    if @camera.update_attributes(params[:camera])	      
	      flash[:success] = "camera details updated"
	      redirect_to product_list_path
	    else
	      render 'edit'
	    end
	end	

	def destroy
	    camera = Camera.find(params[:id])
	    product = Product.find_by_item_id_and_type(camera.id, "Camera")
	    Product.delete(product.id) 	
	    camera.destroy

	    flash[:success] = "Camera is destroyed."
	    redirect_to product_list_path
  	end
end
