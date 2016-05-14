class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	# GET /products
	# GET /products.json
	def index
		#@products = Product.all
		@products = Product.all
		if params[:search]
			@products = Product.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
		else
			@products = Product.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
		end

		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end

	end

	# GET /products/1
	# GET /products/1.json
	def show
	end

	# GET /products/new
	def new
		if current_user.admin?
			#@product = Product.new
			@product = Product.new
			@categories = Category.all.map{|c| [ c.name, c.id ] }
		end
	end

	# GET /products/1/edit
	def edit
		if current_user.admin?
			 @categories = Category.all.map{|c| [ c.name, c.id ] }
		end
	end

	# POST /products
	# POST /products.json
	def create
		if current_user.admin?
			@product = Product.new(product_params)
			@product.category_id = params[:category_id]

			respond_to do |format|
				if @product.save
				format.html { redirect_to @product, notice: 'Product was successfully created.' }
				format.json { render :show, status: :created, location: @product }
				else
				format.html { render :new }
				format.json { render json: @product.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	# PATCH/PUT /products/1
	# PATCH/PUT /products/1.json
	def update
		if current_user.admin?
			@product.category_id = params[:category_id]
			respond_to do |format|
				if @product.update(product_params)
				format.html { redirect_to @product, notice: 'Product was successfully updated.' }
				format.json { render :show, status: :ok, location: @product }
				else
				format.html { render :edit }
				format.json { render json: @product.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	# DELETE /products/1
	# DELETE /products/1.json
	def destroy
		if current_user.admin?
			@product.destroy
			respond_to do |format|
				format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
				format.json { head :no_content }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_product
		@product = Product.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def product_params
		params.require(:product).permit(:title, :description, :photo, :price, :category_id)
	end
end
