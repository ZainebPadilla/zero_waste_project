class TestMailer < ApplicationMailer
  def test_email(user)
    @user = user
    mail(
      to: @user.email,   # Destinataire correct
      subject: "Test Mailjet",
      body: "Ceci est un test pour vérifier Mailjet avec Rails."
    )
  end
end
