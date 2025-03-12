class PagesController < ApplicationController

  before_action :set_objects_contact

  def home
  end

  def about
  end

  def contact
    @tels =  YAML.load_file("#{Rails.root.to_s}/db/contacts.yml")['tels']
    #@objects_form = YAML.load_file("#{Rails.root.to_s}/config/locales/#{locale.to_s}.yml")["#{locale.to_s}"]["form"]["objects"].values

    add_breadcrumb t("contact.contact_titre") , :contact_path
  end

  def send_contact
    object = params[:contact][:subject]
    index_object = @objects_form.index object
    subject = YAML.load_file("#{Rails.root.to_s}/config/locales/fr.yml")["fr"]["form"]["objects"].keys[index_object]
    subject_fr = YAML.load_file("#{Rails.root.to_s}/config/locales/fr.yml")["fr"]["form"]["objects"][subject]

    case subject #key of objects form
    when subject == "cosmetique"
    when subject == "analyse"
    when subject == "extraction"
    when subject == "ingredient"
    when subject == "informations"
    when subject == "stage"
    when subject == "autre"
    else
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
