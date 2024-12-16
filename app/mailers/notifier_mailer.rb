class NotifierMailer < ApplicationMailer

    default from: "kontikids@icloud.com", # Remplacez par votre adresse d'expéditeur validée sur Mailjet
    to: "zainebt16@gmail.com" # Remplacez par votre adresse de réception

  def simple_message(first_name, last_name, email, message)
  mail(
  reply_to: "#{email}",
  subject: "New contact form message",
  body: "Message from #{first_name} #{last_name} (#{email}):\n\n#{message}" )
  end
end
