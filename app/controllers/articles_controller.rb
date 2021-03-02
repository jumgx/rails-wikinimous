class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all

  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end


  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    @article.update(article_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy

    # no need for app/views/articles/destroy.html.erb
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
