class SessionsController <ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if session[:previous_url] == nil
      redirect_to projects_path, notice: "Successfully Logged In!"
      else
        redirect_to session[:previous_url], notice: "Successfully Logged In!"
        session[:previous_url] = nil
      end
    else
      @sign_in_error = 'Username / password combination is invalid'
      render :new
    end
  end

  #logs a user out
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Logged out!"
  end
end
