class CommentsController < ApplicationController
  before_action :set_comment, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :update, :delete]

  # GET /comments/new
  def new
    @comment = current_user.comments.build
    p "HEY HERE IS MY COMMENT"
    p params
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
        redirect_to root_path
    else
        flash[:alert] = @comment.errors.full_messages[0]
        render 'posts/show'
    end

      ##@post = Post.find(params[:id])
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(comment_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
