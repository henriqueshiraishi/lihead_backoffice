class Backoffice::MembersController < BackofficeController
  after_action :verify_authorized, only: :destroy
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params_member)
    if @member.save
      redirect_to backoffice_members_path, notice: "O membro #{@member.email} foi cadastrado com sucesso."
    else
      :new
    end
  end

  def edit
  end

  def update
    if @member.update(params_member)
      redirect_to backoffice_members_path, notice: "O membro #{@member.email} foi atualizado com sucesso."
      MemberMailer.update_email(current_admin, @member).deliver_now
    else
      :edit
    end
  end

  def destroy
    authorize @member
    member_email = @member.email
    if @member.destroy
      redirect_to backoffice_members_path, notice: "O membro #{member_email} foi deletado com sucesso."
    else
      :index
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def params_member

    passwd = params[:member][:password]
    passwd_confirmation = params[:member][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:member].except!(:password, :password_confirmation)
    end

    params.require(:member).permit(:email, :password, :password_confirmation, :type_member, :category)
  end
end
