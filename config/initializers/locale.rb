
# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

# Permitted locales available for the application
I18n.available_locales = [:fr, :en, :de, :es]

# Set default locale to something other than :fr
I18n.default_locale = :en
