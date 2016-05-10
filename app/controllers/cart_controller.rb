class CartController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def add
		id = params[:id]
		# If the has already been created, use the existing cart else create a new cart
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
		# If the product has already been added to cart, increment the value else set the value to 1
		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end
		redirect_to :action => :index
	end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end

	def index
		# If there is a cart, pass it to the page for display else pass an empty value
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
end
