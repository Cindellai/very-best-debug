class UsersController < ApplicationController

  def home
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "users/index" })
  end

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "users/index" })
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.first

    render({ :template => "users/show" })
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    if user.save
      redirect_to("/users/#{user.username}")
    else
      render({ :template => "users/index" })
    end
  end
  
  def update
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    the_user = matching_users.first
    
    if the_user.update(username: params.fetch("query_username"))
      redirect_to("/users/#{the_user.username}")
    else
      render({ :template => "users/show" })
    end
  end

end
