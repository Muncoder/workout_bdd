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
			flash[:alert] = "Error! could not be created"
			render "new"
		end
	end


	private
		def article_params
			params.require(:article).permit(:title, :body)
		end

end