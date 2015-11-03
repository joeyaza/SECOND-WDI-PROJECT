class CommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = Comment.build_from( @place, current_user.id, params[:comment][:body] )
    @comment.save!
    redirect_to root_path
  end

end