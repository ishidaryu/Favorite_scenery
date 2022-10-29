class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      flash[:notice] = 'お問い合わせに成功しました。。'
      redirect_to sceneries_path
    else
      render :new
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :content)
    end
end