class SessionsController < ApplicationController
	def new

	end

	def create 
		seller = Seller.find_by(username: params[:login][:username])
		if seller && seller.authenticate(params[:login][:password])
			session[:user_id] = seller.id.to_s 
			redirect_to sellers_path 
		else 
			redirect_to items_path

		end
	end

	def destroy
		session.delete(:user_id) 
		redirect_to items_path
	end
end
