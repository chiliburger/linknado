class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_link, only: [:new]

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment      = Comment.new
    @comment.link = @link
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /comments/1
  def destroy
    @link = @comment.link

    @comment.destroy
    redirect_to link_path(@link)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.where(id: params[:id]).first
  end

  def set_link
    if params[:link_id].present?
      @link = Link.where(id: params[:link_id]).first
    end

    redirect_to root_path unless @link.present?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:link_id, :username, :body)
  end
end
