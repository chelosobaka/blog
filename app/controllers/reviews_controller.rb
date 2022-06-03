class ReviewsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @review = @post.reviews.build(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to request.referrer, notice: 'Комментарий успешно создан.' }
      else
        format.html { redirect_to post_path(@post), alert: 'Комментарий не был создан.' }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
