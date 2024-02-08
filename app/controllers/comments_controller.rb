class CommentsController < ApplicationController
  def create
    comment = Comment.new(params_comments)
    if comment.save
      redirect_to "/prototypes/#{comment.prototype_id}"
    else
      render "prototype/show"
    end
  end

  private
  def params_comments
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id:params[:prototype_id] )
  end

end
