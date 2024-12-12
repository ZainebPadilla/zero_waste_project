class ContactController < ApplicationController
  def new
    # Initialize an empty form object (optional, but useful for validation)
    @contact_form = ContactForm.new
  end

  def create
    # Handle form submission
    @contact_form = ContactForm.new(contact_params)

    if @contact_form.valid?
      # Send the email (using the mailer method defined earlier)
      ContactMailer.contact_email(@contact_form).deliver_now
      redirect_to thank_you_path, notice: 'Votre message a été envoyé avec succès!'
    else
      # If validation fails, render the form again with errors
      render :new, alert: 'Une erreur est survenue. Veuillez réessayer.'
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:email, :message)
  end
end
