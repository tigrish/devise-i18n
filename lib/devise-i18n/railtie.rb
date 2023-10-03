require 'rails'
require 'devise-i18n/view_helpers'

module DeviseI18n
  class Engine < ::Rails::Engine
    isolate_namespace DeviseI18n
    initializer 'devise_i18n.action_controller' do
      ActiveSupport.on_load :action_controller do
        helper DeviseI18n::ViewHelpers if respond_to?(:helper)
      end
    end
  end

  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'devise-i18n' do |app|
      DeviseI18n::Railtie.instance_eval do
        pattern = pattern_from app.config.i18n.available_locales

        add("rails/locales/#{pattern}.yml")
      end
    end

    protected

    def self.add(pattern)
      files = Dir[File.join(File.dirname(__FILE__), '../..', pattern)]
      I18n.load_path.concat(files)
    end

    def self.pattern_from(args)
      array = Array(args || [])
      array.blank? ? '*' : "{#{array.join ','}}"
    end
  end
end
