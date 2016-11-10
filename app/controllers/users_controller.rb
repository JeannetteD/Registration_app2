class UsersController < ApplicationController
  def index
  end

  def register
    @user = User.new
    @user.full_name = params[:full_name]
    @user.street_address = params[:street_address]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.postal_code = params[:postal_code]
    @user.country = params[:country]
    @user.email = params[:email]
    @user.user_id = params[:user_id]
    @user.password = params[:password]
    @user.save
  end

  def login
    # takes user id entered in the log in form and stores it in the user_id variable
    user_id = params[:login_user_id]
    # takes passwrod entered in the log in form and stores it in the pass variable
    pass = params[:login_password]
    # goes into the table and looks for a match between column called user_id and the contents of the user_id variable and retrieves the object that corresponds to that row and stores that in the instance variable @user.
    @user = User.find_by_user_id(user_id)

    # compares password entered by user with password stored in the retrieved user object and makes sure user object is not empty.
    if !@user.nil? && pass == @user.password
      # if it's a match, the login is successful and display the confirmation page.
      render :login
    else
      # if it's not a match, it discplays an error message.
      render text: "Incorrect user id or password"
    end


  end
end
