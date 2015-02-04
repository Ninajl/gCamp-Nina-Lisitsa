class UsersController <ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
      @users = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
        if @user.save
         redirect_to users_path, notice: 'User was successfully created.'
        else
          render :new
        end
      end
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end