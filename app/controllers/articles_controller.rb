class ArticlesController < ApplicationController

	def index
		@articles = Article.all.order("created_at DESC")
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			flash[:alert] = "Article has been created"
			redirect_to articles_path
		else
			flash.now[:alert] = "Article has not been created"
			render "new"
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:alert] = "Article has been updated successfully"
			redirect_to @article
		else
			flash.now[:alert] = "Article could not be updated"
			render "edit"
		end
	end

	def destroy
		@article = Article.find(params[:id])

		@article.delete
		flash[:notice] = "Article has been deleted"
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :body)
		end

end

