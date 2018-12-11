class Admin::UsersController < Admin::HghlandController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash_msg(:success,"#{params[:commit]}成功")
      redirect_to admin_users_path
    else
      flash_msg(:error,"#{params[:commit]}失败#{@user.error_msg}")
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash_msg(:success,"#{params[:commit]}成功")
      redirect_to admin_users_path
    else
      flash_msg(:error,"#{params[:commit]}失败#{@user.error_msg}")
      render :edit
    end
  end

  def show

  end

  def destroy
    @user.destroy ? flash_msg(:success,"已成功删除") :  flash_msg(:error,"删除失败#{@user.error_msg}")
    redirect_to params[:back]
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :email,role_ids: [])
  end
end
