class UserMailer < ApplicationMailer
  def reset_password_instructions(user, token)
    @user = user
    @token = token

    # Email send with HTML and text
    mail(to: @user.email, subject: 'Réinitialisation de votre mot de passe') do |format|
      format.html { render 'reset_password_instructions' }  # Use template
      format.text { render plain: 'Voici votre lien pour réinitialiser votre mot de passe: [lien]' }
    end
  end
end