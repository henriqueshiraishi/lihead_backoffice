class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :set_authorize, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :create, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O administrador #{@admin.name} foi cadastrado com sucesso."
    else
      :new
    end
    authorize @admin
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O administrador #{@admin.name} foi atualizado com sucesso."
    else
      :edit
    end
  end

  def destroy
    admin_name = @admin.name
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O administrador #{admin_name} foi deletado com sucesso."
    else
      :index
    end
  end

  private

  def set_authorize
    authorize @admin
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

    params.require(:admin).permit(policy(Admin).permitted_attributes)
  end
end
