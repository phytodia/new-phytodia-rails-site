class PagesController < ApplicationController
  def home
  end

  def about
  end

  def laboratoire_plantes
    @prestations = ["Analyse molécules végétales","Mise en conformité réglementaire","Analyse & conseil","Chimie analytique & Phytochimie","Extraction végétale","Full caractérisation","Analyse de tout type de plantes"]
  end
  def analyses

  end
  def cosmetologie

  end
end
