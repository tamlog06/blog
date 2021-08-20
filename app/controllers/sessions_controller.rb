class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the blog!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def log_in
    user = User.find_by(email: params[:session][:email].downcase)
    # authenticate パスワードが一致したらuser, 間違ってたらfalseを返すメソッド
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    if logged_in?
      log_out
    end
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation)
    end

    # beforeアクション
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to(root_url)
      end
    end
end
