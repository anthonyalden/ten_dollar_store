class ItemsController < ApplicationController


	

	def index
		# retrieves ALL the beans in our database

			  is_seller = false
		      @items = Item.where(:search_tags => /.*#{params[:q]}.*/i)
			  if is_seller == false
			  	render "buyerindex"
			  else
			  	render "index"
			  end
		
	end

	def show
		# retrieves ONE specific bean in our database
		# the parms refers to rails object with a key and object hash.  one of the hashes is an :id key.
		#       :id comes from the url specifically the part that has the id specified in the routes
		# Bean is our model
		# .find is method available to our Bean model it comes from mongoid gem
		@item = Item.find(params[:id])
	end

	def new
		# this makes a new one
		@item = Item.new
	end

	def create
		#the params object has some methods like .requre and .permit.  The permit says what attributes can be saved
		# :item is from the model
		# @item = item.new(params.require(:item).permit(:name, :roast, :origin, :quantity))
		@item = Item.new (item_params)
		if @item.save 
			# if save is ok go back to index.html
			redirect_to items_path
		else
			# if not successful go back to new page to reenter the data again
			render "new"
		end
	end

	def edit
		# action for retrieving a specific been
		# this is the same code you use for the show action
		@item = Item.find(params[:id])
		@seller = Seller.new.username

	end

	def update
		# this retrieves a specific item from database
		@item = Item.find(params[:id])
		# if @item.update_attributes(params.require(:item).permit(:name, :roast, :origin, :quantity))
		# 	redirect_to items_path
		# else
		# 	render "edit"
		# end

		if @item.update_attributes(item_params)
			redirect_to items_path
		else
			render "edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end


private
# anyting in this private area 
	def item_params
		params.require(:item).permit(:item_tag, :description, :photo, :category, :search_tags, :shipping_cost, :sold, :seller, :username)
	end

end