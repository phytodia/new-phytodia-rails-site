class PagesController < ApplicationController

  before_action :set_objects_contact, only: [:contact,:send_contact]

  def home
  end

  def about
  end

  def contact
    @tels =  YAML.load_file("#{Rails.root.to_s}/db/contacts.yml")['tels']
    #@objects_form = YAML.load_file("#{Rails.root.to_s}/config/locales/#{locale.to_s}.yml")["#{locale.to_s}"]["form"]["objects"].values

    @marker = [48.526229995125526,7.7391784820052605]

    add_breadcrumb t("contact.contact_titre") , :contact_path
  end

  def send_contact
    object = params[:contact][:subject]
    index_object = @objects_form.index object
    subject = YAML.load_file("#{Rails.root.to_s}/config/locales/fr.yml")["fr"]["form"]["objects"].keys[index_object]
    subject_fr = YAML.load_file("#{Rails.root.to_s}/config/locales/fr.yml")["fr"]["form"]["objects"][subject]

    if subject == "cosmetique"
      service_phytodia_mail = ["th@phytodia.com","cj@phytodia.com"]
    elsif subject == "analyse"
      service_phytodia_mail = ["th@phytodia.com","hunckler.thomas@hotmail.fr"]
    elsif subject == "extraction"
      service_phytodia_mail = ["th@phytodia.com","hunckler.thomas@hotmail.fr"]
    elsif subject == "ingredient"
      service_phytodia_mail = ["th@phytodia.com","hunckler.thomas@hotmail.fr"]
    elsif subject == "informations"
      service_phytodia_mail = ["th@phytodia.com","hunckler.thomas@hotmail.fr"]
    elsif subject == "stage"
      service_phytodia_mail = ["th@phytodia.com","hunckler.thomas@hotmail.fr"]
    elsif subject == "autre"
      service_phytodia_mail = ["th@phytodia.com","hunckler.thomas@hotmail.fr"] #["hunckler.thomas@hotmail.fr","cj@phytodia.com"]
    else
      service_phytodia_mail = ["tf@phytodia.com"]
    end

    elements_mail = params[:contact]
    service_phytodia_mail.each do |destinataire|
      ContactMailer.with(
        service_phytodia: destinataire,
        subject:subject_fr,
        sender_email:elements_mail[:mail],
        sender_lastname:elements_mail[:name],
        sender_firstname:elements_mail[:firstname],
        sender_address:elements_mail[:address],
        sender_zip_code:elements_mail[:zip_code],
        sender_city:elements_mail[:city],
        sender_phone:elements_mail[:tel],
        sender_message:elements_mail[:message],
        sender_files:"",
        sender_rgpd:elements_mail[:rgpd],
        sender_lang: params[:locale]
      ).new_contact.deliver_now
      puts "--- Email envoyé ---"
      puts subject
      puts subject_fr
      puts destinataire
    end

    if params[:locale] == "fr"
      redirect_to contact_fr_path
    elsif params[:locale] == "en"
      redirect_to contact_en_path
    elsif params[:locale] == "de"
      redirect_to contact_de_path
    elsif params[:locale] == "es"
      redirect_to contact_es_path
    else
      redirect_to contact_fr_path
    end

  end

  def laboratoire_plantes
    @prestations = ["Analyse molécules végétales","Mise en conformité réglementaire","Analyse & conseil","Chimie analytique & Phytochimie","Extraction végétale","Full caractérisation","Analyse de tout type de plantes"]
  end
  def analyses

  end
  def cosmetologie
  end
  def prestation_displayed
    fail
  end

  private
  def set_objects_contact
    @objects_form = YAML.load_file("#{Rails.root.to_s}/config/locales/#{locale.to_s}.yml")["#{locale.to_s}"]["form"]["objects"].values
  end


end
