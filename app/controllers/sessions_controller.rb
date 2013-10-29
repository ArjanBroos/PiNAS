class SessionsController < ApplicationController
  def new
    render "new"
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Succesfully logged in"
      sign_in user
      redirect_to root_path
    else
     flash.now[:danger] = "Invalid username/password combination"
     render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
