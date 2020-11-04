class CommentsController < ApplicationController
  def add
    # Parameters: {"query_photo_id"=>"635", "query_author_id"=>"", "query_body"=>""}
    input_photo_id = params.fetch("query_photo_id")
    input_author_id = params.fetch("query_author_id")
    comment_body = params.fetch("query_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = comment_body

    a_new_comment.save

    # render({ :template => "comment_templates/add.html.erb"})

    redirect_to("/photos/" + a_new_comment.photo_id.to_s)
  end
end