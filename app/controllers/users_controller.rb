class UsersController <ApplicationController
   before_action :authenticate


    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
        if @user.save
         redirect_to users_path, notice: 'User was successfully created.'
        else
          flash.now[:alert] = "Error creating user"
          render :new
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)

          redirect_to users_path,  notice: 'User was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @user = User.find(params[:id])
        if @user.destroy
          redirect_to users_url, alert: 'User was successfully destroyed'
        end
      end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
