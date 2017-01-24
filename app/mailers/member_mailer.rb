class MemberMailer < ApplicationMailer

  def update_email(current_admin, member)
    @current_admin = current_admin
    @member = member

    mail to: "<%= @member.email %>", subject: "Seu cadastro foi alterado."
  end

end
