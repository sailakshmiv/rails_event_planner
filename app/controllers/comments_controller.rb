class CommentsController < ApplicationController
  def create
  	@comment = Comment.new(comment_params) 
  	if @comment.save
  		flash[:success] = 'Comment Posted!'
  		redirect_to :back
  	else
  		flash[:errors] = @comment.errors.full_messages
  		redirect_to :back
  	end
  end

  private 

  def comment_params
  	params.require(:comment).permit(:comment, :user_id, :event_id)
  end
end
