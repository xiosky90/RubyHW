class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[show update destroy]

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags, include: [], each_serializer: TagSerializer
  end

  # GET /tags/1
  def show
    render json: @tag, serializer: TagSerializer
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag, serializer: TagSerializer
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tag_params
    params.require(:tag).permit(:name)
  end
end
