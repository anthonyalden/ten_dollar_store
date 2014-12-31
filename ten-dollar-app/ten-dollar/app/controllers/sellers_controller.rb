class SellersController < ApplicationController
	def index
		# retrieves ALL the beans in our database
		@sellers =Seller.all
	end

	def show
		# retrieves ONE specific bean in our database
		# the parms refers to rails object with a key and object hash.  one of the hashes is an :id key.
		#       :id comes from the url specifically the part that has the id specified in the routes
		# Bean is our model
		# .find is method available to our Bean model it comes from mongoid gem
		@seller = Seller.find(params[:id])
	end

	def new
		# this makes a new one
		@seller = Seller.new
	end

	def create
		#the params object has some methods like .requre and .permit.  The permit says what attributes can be saved
		# :seller is from the model
		# @seller = seller.new(params.require(:seller).permit(:name, :roast, :origin, :quantity))
		@seller = Seller.new (seller_params)
		if @seller.save 
			# if save is ok go back to index.html
			redirect_to sellers_path
		else
			# if not successful go back to new page to reenter the data again
			render "new"
		end
	end

	def edit
		# action for retrieving a specific been
		# this is the same code you use for the show action
		@seller = Seller.find(params[:id])

	end

	def update
		# this retrieves a specific seller from database
		@seller = Seller.find(params[:id])

		if @seller.update_attributes(seller_params)
			redirect_to sellers_path
		else
			render "edit"
		end
	end

	def destroy
		@seller = Seller.find(params[:id])
		@seller.destroy
		redirect_to sellers_path
	end


private
# anyting in this private area is only visible to this class
	def seller_params
		params.require(:seller).permit(:username, :password, :first_name, :last_name, :phone, :email)
	end

end