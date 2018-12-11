class Admin::RolesController < Admin::HghlandController
  def index
    @roles = Role.page(params[:page]).per(10)
  end

  def new

  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash_msg(:success,"#{params[:commit]}成功")
      redirect_to admin_roles_path
    else
      flash_msg(:error,"#{params[:commit]}失败#{@role.error_msg}")
      render :new
    end
  end

  def edit

  end

  def update
    if @role.update_attributes(role_params)
      flash_msg(:success,"#{params[:commit]}成功")
      redirect_to admin_roles_path
    else
      flash_msg(:error,"#{params[:commit]}失败#{@role.error_msg}")
      render :edit
    end
  end

  def destroy
    @role.destroy ? flash_msg(:success,"已成功删除") :  flash_msg(:error,"删除失败#{@role.error_msg}")
    redirect_to params[:back]
  end

  private
  def role_params
    params.require(:role).permit(:name, :desc)
  end
end
