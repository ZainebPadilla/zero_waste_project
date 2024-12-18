class NotifierMailer < ApplicationMailer

    default from: "kontikids@icloud.com", # validated sender address on Mailjet
    to: "zainebt16@gmail.com" # receiving address

  def simple_message(first_name, last_name, email, message)
  mail(
  reply_to: "#{email}",
  subject: "New contact form message",
  body: "Message from #{first_name} #{last_name} (#{email}):\n\n#{message}" )
  end
end
