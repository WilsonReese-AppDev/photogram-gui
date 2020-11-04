class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    render({ :template => "user_templates/show.html.erb" })
  end

  def add
    # Parameters: {"query_username"=>"reese"}
    input_username = params.fetch("query_username")

    a_new_user = User.new
    a_new_user.username = input_username

    a_new_user.save

    # render({ :template => "user_templates/add.html.erb" })
    redirect_to("/users/" + a_new_user.username)
  end

  def update
    # Parameters: {"query_username"=>"qwerty", "path_username"=>"qwert"}
    updated_username = params.fetch("query_username")
    current_username = params.fetch("path_username")

    matching_users = User.where({ :username => current_username})
    the_user = matching_users.first

    the_user.username = updated_username

    the_user.save

    # render({ :template => "user_templates/update.html.erb" })
    redirect_to("/users/" + the_user.username)
  end
  
end