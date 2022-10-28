class Public::SceneryCommentsController < ApplicationController

  def create
    scenery = Scenery.find(params[:scenery_id])
    @comment = current_user.scenery_comments.new(scenery_comment_params)
    @comment.scenery_id = scenery.id
    @comment.save
  end

  def destroy
    @comment = SceneryComment.find(params[:id])
    @comment.destroy
  end

  private

  def scenery_comment_params
    params.require(:scenery_comment).permit(:comment).merge(user_id: current_user.id ,scenery_id: params[:scenery_id])
  end
end
