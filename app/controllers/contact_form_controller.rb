class ContactFormController < ApplicationController
  def create
    # Extract form parameters from the 'contact_form' input
    @first_name = params[:contact_form][:first_name]
    @last_name = params[:contact_form][:last_name]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    # Send the extracted data to the NotifierMailer to send an email
    NotifierMailer.simple_message(@first_name, @last_name, @contact_email, @message).deliver_now
    
    flash[:success] = "Votre message a bien été envoyé."
    redirect_to :root
  end
end
