class TestMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(
      to: @user.email,   # Destinataire correct
      subject: "Test Mailjet",
      body: "Bienvenu sur Eco²"
    )
  end
end
