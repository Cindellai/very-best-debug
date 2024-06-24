# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.body = params.fetch("query_body")
    @comment.author_id = params.fetch("query_author_id")
    @comment.venue_id = params.fetch("query_venue_id")

    if @comment.save
      redirect_to("/venues/#{@comment.venue_id}")
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
