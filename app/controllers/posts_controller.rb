class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    '''
    밑에건 추후에 post 테이블에 is_deleted 컬럼추가 후 사용할 로직
    '''
    '''
    if @post.nil? && @post.is_deleted
      respond_to do |format|
        format.html { render :is_deleted, status: :unprocessable_entity }
      end
    end
    '''
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    #binding.b 
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        puts "@post:", @post ,@post.title
      else
        #binding.b
        puts "@post의 에러:" , @post.errors
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
    # if @post.save
    #   redirect_to post_url(@post), notice: "Post was successfully created."
    #   puts "post_params:", post_params
    #   puts "@post:", @post ,@post.title
    # else
    #   #binding.b
    #   puts "@post의 에러:" , @post.errors
    #   render :new, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    '''
    밑에건 추후에 post 테이블에 is_deleted 컬럼추가 후 사용할 로직
    '''
    # find_by_id()는 레코드를 찾지 못한 경우 nil을 반환하게 되어 @post가 nil이 됩니다. ActiveRecord::RecordNotFound 예외가 발생 안함
    '''
    def set_post
      @post = Post.where(is_deleted: false).find_by_id(params[:id])
    end
    '''

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title,:body, :premium)
    end
end
