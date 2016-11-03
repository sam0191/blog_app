class ArticlesController < ApplicationController
 	before_action :authenticate_user!, except: [:index, :show]
 	before_action :set_article, only: [:show, :edit, :update, :destroy] 
  def index
  	@article = Article.all
  end

  def new
  	@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "Article has been created"
			redirect_to articles_path
		else
			flash.now[:danger] = "Article has not been created"
			render :new
		end 
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Article has been updated"
			redirect_to @article
		else
			flash.now[:danger] = "Article has not been updated"
			render "edit"
		end
	end

	def destroy

		if @article.destroy
			flash[:success] = "Article has been deleted"
			redirect_to articles_path
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end

	def set_article
		@article = Article.find(params[:id])
	end

end
