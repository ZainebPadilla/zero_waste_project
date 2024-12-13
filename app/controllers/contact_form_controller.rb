class ContactFormController < ApplicationController
  def create
    @first_name = params[:contact_form][:first_name]
    @last_name = params[:contact_form][:last_name]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    NotifierMailer.simple_message(@first_name, @last_name, @contact_email, @message).deliver_now
    # Perform any necessary actions with the form data
    flash[:success] = "Your message has been sent successfully."
    redirect_to :root
  end
end
