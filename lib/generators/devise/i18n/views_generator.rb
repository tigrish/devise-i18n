module Devise
  module I18n
    module ViewPathTemplates #:nodoc:
      extend ActiveSupport::Concern

      included do
        argument :scope, required: false, default: nil, desc: "The scope to copy views to"

        class_option :form_builder, aliases: "-b"
        class_option :views, aliases: "-v", type: :array, desc: "Select specific view directories to generate (confirmations, passwords, registrations, sessions, unlocks, mailer)"

        public_task :copy_views
      end

      def copy_views
        if options[:views]
          options[:views].each { |directory| view_directory(directory.to_sym) }
        else
          view_directory :confirmations
          view_directory :passwords
          view_directory :registrations
          view_directory :sessions
          view_directory :unlocks
        end
      end

      protected

      def view_directory(name, target_path = nil)
        directory name.to_s, target_path || "#{default_target_path}/#{name}" do |content|
          if scope
            content.gsub "devise/shared/links", "#{plural_scope}/shared/links"
          else
            content
          end
        end
      end

      def default_target_path
        @default_target_path ||= "app/views/#{plural_scope || :devise}"
      end

      def plural_scope
        @plural_scope ||= scope.presence && scope.underscore.pluralize
      end
    end

    class SharedViewsGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../../app/views/devise", __FILE__)
      desc "Copies shared Devise views to your application."
      hide!

      # Override copy_views to just copy mailer and shared.
      def copy_views
        view_directory :shared
      end
    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../../app/views/devise", __FILE__)
      desc "Copies default Devise views to your application."
      hide!
    end

    class SimpleFormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../templates/simple_form_for", __FILE__)
      desc "Copies simple form enabled views to your application."
      hide!

      def copy_views
        options[:views].delete("mailer") if options[:views]
        super
      end
    end

    class MailerViewsGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../../app/views/devise", __FILE__)
      desc "Copies Devise mail erb views to your application."
      hide!

      def copy_views
        if !options[:views] || options[:views].include?("mailer")
          view_directory :mailer
        end
      end
    end

    class ViewsGenerator < Rails::Generators::Base
      desc "Copies Devise views to your application."

      argument :scope, required: false, default: nil, desc: "The scope to copy views to"

      invoke SharedViewsGenerator
      invoke MailerViewsGenerator

      hook_for :form_builder, aliases: "-b",
                              desc: "Form builder to be used",
                              default: "i18n:#{defined?(SimpleForm) ? 'simple_form_for' : 'form_for'}"
    end
  end
end
