class ArticlesController < ApplicationController
  #respond_to :json
  after_action :verify_authorized
  after_action :verify_policy_scoped, only: :index

  def index
    authorize Article
    @articles = Article.all
    policy_scope(Article)
    render json: @articles
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    authorize article
    article.user = current_user
    if article.save!
      render json: article, status: :created
    else
      render json: {errors: {error: "Record not created"}}, status: :failed
    end
  end

  def edit
    Article.find(params[:id])
  end

  def show
    article = Article.find(params[:id])
    authorize article
    render json: article
  end

  def update
    article = Article.find(params[:id])
    authorize article
    if article.update_attributes(article_params)
      render json: article
    else
      render json: {errors: {error: "Failed to update"}}, status: :failed
    end
  end

  def destroy
    article = Article.find(params[:id])
    authorize article
    article.destroy
    render json: {}
  end

  private

  def article_params
    params.permit(:id, :name, :title, :content, :user)
  end

end