class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy switch_status]
  before_action :set_comments, only: %i[index]

  # GET /comments published/unpublished
  def index
    @comments = @comments.where(status: params[:status]) if params[:status].present?
    @comments = @comments.filter_by_last_items_limit(params[:last]) if params[:last].present?

    render json: @comments, include: [], each_serializer: CommentSerializer
  end

  # GET /comments/1
  def show
    render json: @comment, serializer: CommentSerializer
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, serializer: CommentSerializer
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  # GET /comments/published
  def published
    @comments = Comment.published
    render json: @comments, include: [], each_serializer: CommentSerializer
  end

  # GET /comments/unpublished
  def unpublished
    @comments = Comment.unpublished
    render json: @comments, include: [], each_serializer: CommentSerializer
  end

  # PATCH /comments/1/switch?status=published
  def switch_status
    @comment.update(status: params[:status]) if params[:status].present?

    render json: @comment, status: :accepted, serializer: CommentSerializer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_comments
    @comments = Comment.all
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :status, :article_id, :author_id)
  end
end
