class SessionsController <ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully Logged In!"
    else
      flash.now[:message] = 'Invalid email/password'
      render :new
    end
  end

  #logs a user out
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Logged out!"
  end
end
