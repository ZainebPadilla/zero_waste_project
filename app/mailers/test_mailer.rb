class TestMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(
      to: @user.email,  
      subject: "Test Mailjet",
      body: "Bienvenu sur Eco²"
    )
  end
end
