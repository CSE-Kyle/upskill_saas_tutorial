class ContactsController < ApplicationController 
  def new 
    @contact = Contact.new
  end
  
  def create 
    @contact = Contact.new(contact_params)
    if @contact.save 
      name = params[:contact][:name] # storing users name
      email = params[:contact][:email] # storing users email
      body = params[:contact][:comments] # storing users comments
      
      ContactMailer.contact_email(name, email, body).deliver # sending email from contact-us form to default email
      flash[:success] = "Message sent."
      redirect_to new_contact_url 
    else 
      flash[:warning] = "Error occured. Message not sent."
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params 
      params.require(:contact).permit(:name, :email, :comments)
    end 
end