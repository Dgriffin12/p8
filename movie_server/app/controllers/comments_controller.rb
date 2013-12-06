class CommentsController < ApplicationController
def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.create(params[:comment].permit(:commenter, :body))
    @comment.commenter = current_user.email
    @comment = current_user.comments.create(params[:comment].permit(:commenter, :body))
    @comment.commenter = current_user.email


    puts "RIGHT HERE!!!!!!!!!!!!!--------------------"
    puts @comment.commenter
    redirect_to review_path(@review)
  end
end
