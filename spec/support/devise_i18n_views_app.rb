require "action_controller/railtie"
require "active_model"
require 'omniauth-twitter'
require 'devise-i18n/view_helpers'

class User
  def email
    'me@example.com'
  end

  def pending_reconfirmation?
    false
  end

  def self.unlock_strategy_enabled?(something)
    true
  end

  def self.omniauth_providers
    [:twitter]
  end

  def remember_me
  end

  def reset_password_token
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

  def model_name
    self.class.model_name
  end

  def errors
    errors = ActiveModel::Errors.new(self)
    errors.add(:base, :invalid)
    errors
  end

  def self.human_attribute_name(attribute, options = {})
    attribute
  end
end
USER = User.new

class DeviseMapping
  def method_missing(m, *args, &block)
    # Enable all modules
    return true if m.to_s.ends_with?('?')
    super
  end
end

class DeviseI18nViewsApp < Rails::Application
  def self.view_path
    @view_path
  end

  def self.use_devise_i18n_views!
    @view_path = 'app/views'
  end

  def self.use_devise_views!
    @view_path = Gem::Specification.find_by_name("devise").gem_dir + '/app/views'
  end

  @view_to_render = nil
  attr_accessor :view_to_render

  secrets.secret_token    = "secret_token"
  secrets.secret_key_base = "secret_key_base"

  config.logger = Logger.new($stdout)
  Rails.logger = config.logger

  routes.draw do
    get :index, to: 'test#index'
  end
end

module TestHelper
  def resource
    USER
  end

  def resource_name
    'User'
  end

  def resource_class
    User
  end

  def devise_error_messages!
  end

  def devise_mapping
    DeviseMapping.new
  end

  def method_missing(m, *args, &block)
    # Just ensure it was the same method with the same params.
    return "#{m}#{args}" if m.to_s.ends_with?('_url') || m.to_s.ends_with?('_path')
    super
  end
end

class TestController < ActionController::Base
  helper TestHelper
  helper DeviseI18n::ViewHelpers

  before_action do
    instance_variable_set(:@view_paths, [])
    prepend_view_path DeviseI18nViewsApp.view_path
  end

  def index
    @resource = USER
    render DeviseI18nViewsApp.view_to_render
  end
end
