class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		if current_user.admin?
			@article = Article.new
		end
	end

	def edit
		if current_user.admin?
			@article = Article.find(params[:id])
		end
	end

	def create
		if current_user.admin?
			@article = Article.new(article_params)

			if @article.save
				redirect_to @article
			else
				render 'new'
			end
		end
	end

	def update
		if current_user.admin?
			@article = Article.find(params[:id])

			if @article.update(article_params)
			redirect_to @article
			else
			render 'edit'
			end
		end
	end

	def destroy
		if current_user.admin?
			@article = Article.find(params[:id])
			@article.destroy

			redirect_to articles_path
		end
	end

	private
		def article_params
		params.require(:article).permit(:title, :text)
		end
end
