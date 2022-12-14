class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy comments published unpublished add_tag]
  before_action :set_articles, only: %i[index]

  # GET /articles
  def index
    @articles = @articles.filter_by_status(params[:status]) if params[:status].present?
    @articles = @articles.filter_by_tag(params[:tag]) if params[:tag].present?

    render json: @articles, only: %i[id title body status created_at]
  end

  # GET /articles/1 comments published/unpublished
  def show
    @comments = @article.comments
    @comments = @comments.filter_by_status(params[:status]) if params[:status].present?
    @comments = @comments.filter_by_last_items_limit(params[:last]) if params[:last].present?

    @tags = @article.tags

    render json: { article: @article, comments: @comments, tags: @tags }
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  # GET /articles/1/comments
  def comments
    @comments = @article.comments.filter_by_status(params[:filter])
    render json: { article: @article, comments: @comments }
  end

  # GET /articles/1/published
  def published
    @comments = @article.comments.published
    render json: { article: @article, comments: @comments }
  end

  # GET /articles/1/unpublished
  def unpublished
    @comments = @article.comments.unpublished
    render json: { article: @article, comments: @comments }
  end

  # POST articles?/1/add-tag?tag=new
  def add_tag
    @tags = @article.tags << Tag.select_tag(params[:tag])
    render json: { article: @article, tags: @tags }, status: :accepted
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def set_articles
    @articles = Article.all
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :status, :author_id)
  end
end
