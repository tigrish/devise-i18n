require 'rails'

module DeviseI18n
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'rails-i18n' do |app|
      I18n.available_locales.each do |available_locale|
        locale_file_path = File.join(File.expand_path(
          File.dirname(__FILE__) + '/../locales'), "available_locale.yml"
        )
        if File.exist?(locale_file_path)
          I18n.load_path << locale_file_path
        end
      end
      I18n.load_path.flatten!
    end
  end
end