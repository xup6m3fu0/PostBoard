class ArticlesController < ApplicationController

	def index
		@articles=Article.all
	end

	def show
		@article=Article.find(params[:id])
		@comments=@article.comments
		@comment=Comment.new
	end

	def new
		@article=Article.new
	end

	def edit
		@article=Article.find(params[:id])
	end

	def create
		@article=Article.new(article_params)
		@article.name=current_user.name #current_user from application_controller
		@article.user_id=session[:user_id]
		if @article.save!
			redirect_to root_path
		end
	end

	def update
		@article=Article.find(params[:id])
		@article.update(article_params)
		redirect_to root_path
	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		redirect_to root_path
	end

	private
	def article_params
		params.require(:article).permit(:name,:title,:content,:user_id)
	end

end