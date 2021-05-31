module DeviseI18n
  module Spec
    module FakeApp
      #
      # Starts a new Rails app and runs the given config block before
      # initializing it
      #
      def self.start
        require 'action_controller/railtie'
        require 'devise-i18n'

        app = Class.new(Rails::Application)
        app.config.eager_load = false
        app.config.i18n.enforce_available_locales = false
        app.config.middleware.use OmniAuth::Builder do
          provider :twitter, "API_KEY", "API_SECRET"
        end

        yield(app.config) if block_given?

        app.initialize!
      end

      #
      # Initialize Rails app in a clean environment.
      #
      # @param test [Proc] which have to be run after app is initialized
      # @return [String] Result of calling +test+ after app was initialized
      #
      def self.run(test, &block)
        r, w = IO.pipe

        pid = fork do
          r.close

          start(&block)

          w.write(test.call)
        end

        w.close
        result = r.read
        Process.wait(pid)
        result
      end
    end
  end
end
