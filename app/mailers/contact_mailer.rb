class ContactMailer < ApplicationMailer
  def new_contact

    @destinataire_service_phytodia = ""
    @subject = subject

    @sender_email = ""
    @sender_lastname = ""
    @sender_firstname = ""
    @sender_address = ""
    @sender_zip_code = ""
    @sender_city = ""
    @sender_phone = ""
    @sender_message = ""
    @sender_files = ""
    @sender_rgpd = ""

    mail(
      to: @destinataire_service_phytodia,
      subject:"#{@subject}| Nouvelle demande | Phytodia"
      #sender_email: @sender_email,
      #sender_lastname:@sender_lastname,
      #sender_firstname:@sender_firstname,
      #sender_address:@sender_address,
      #sender_zip_code:@sender_zip_code,
      #sender_city:@sender_city,
      #sender_phone:@sender_phone,
      #sender_message:@sender_message,
      #sender_files:@sender_files,
      #sender_rgpd:@sender_rgpd
    )
  end
end
