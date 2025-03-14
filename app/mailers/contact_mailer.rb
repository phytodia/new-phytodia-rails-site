class ContactMailer < ApplicationMailer
  default from: "contact@phytodia.xyz"
  def new_contact

    @destinataire_service_phytodia = params[:service_phytodia]
    @subject = params[:subject]
    @sender_email = params[:sender_email]
    @sender_lastname = params[:sender_lastname]
    @sender_firstname = params[:sender_firstname]
    @sender_address = params[:sender_address]
    @sender_zip_code = params[:sender_zip_code]
    @sender_city = params[:sender_city]
    @sender_phone = params[:sender_phone]
    @sender_message = params[:sender_message]
    @sender_files = params[:sender_files]
    @sender_rgpd = params[:sender_rgpd]
    @sender_lang = params[:sender_lang]
    @prestations_cosmetics = params[:prestations_cosmetics]

    mail(
      to: @destinataire_service_phytodia,
      reply_to:@sender_email,
      subject:"#{@subject} | Nouvelle demande | Phytodia",
      sender_email:@sender_email,
      sender_lastname:@sender_lastname,
      sender_firstname:@sender_firstname,
      sender_address:@sender_address,
      sender_zip_code:@sender_zip_code,
      sender_city:@sender_city,
      sender_phone:@sender_phone,
      sender_message:@sender_message,
      sender_files:@sender_files,
      sender_rgpd:@sender_rgpd,
      lang_sender:@sender_lang,
      prestations_cosmetics: @prestations_cosmetics
    )
  end
end
