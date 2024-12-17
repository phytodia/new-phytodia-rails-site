class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #allow_browser versions: :modern

  around_action :switch_locale
  before_action :langues_available

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def langues_available
    @langues = I18n.available_locales.select {|lang| lang == :fr || lang == :en}
  end

end
