class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @tels =  YAML.load_file("#{Rails.root.to_s}/db/contacts.yml")['tels']
    @objects_form = YAML.load_file("#{Rails.root.to_s}/config/locales/#{locale.to_s}.yml")["#{locale.to_s}"]["form"]["objects"].values

    add_breadcrumb t("contact.contact_titre") , :contact_path
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
end
