class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
 
    if @user.save
      session[:user_id] = @user.id

      # Tell the UserMailer to send a welcome email 
      UserMailer.welcome_email(@user).deliver_now
      redirect_to('/', :notice => 'User created')

    else
      render :action => 'new'
    end
    
  end

  private
  def user_params
    params[:user][:email] = params[:user][:email].downcase.strip
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
