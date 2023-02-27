require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'rspec/rails'

def devise_views
  Dir.glob(Gem::Specification.find_by_name("devise").gem_dir + '/app/views/**/*.html.erb')
    .map{ |view_path| view_path.split('/')[-3..-1].join('/')}
    .map{ |view_path| view_path.split('.')[0] }
end

def available_locales
  Dir.glob('rails/locales/*.yml')
    .map{ |locale_path| locale_path.split('/').last }
    .map{ |locale_path| locale_path.split('.').first }
end

def render_devise_view
  DeviseI18nViewsApp.use_devise_views!
  get :index
  response.body.gsub('&#39;', "'")
end

def render_devise_i18n_view
  DeviseI18nViewsApp.use_devise_i18n_views!
  get :index
  response.body.gsub('&#39;', "'")
end

RSpec.describe TestController, type: :controller do
  render_views

  devise_views.each do |view_path|
    describe "#{view_path}" do
      before do
        DeviseI18nViewsApp.view_to_render = view_path
        allow(I18n).to receive(:load_path).and_return(Dir[Rails.root.join('rails', 'locales', '*.yml')])
      end
      
      it 'is the same as the devise view when rendered with English' do
        I18n.locale = :en
        expect(render_devise_i18n_view).to eq(render_devise_view)
      end
      
      available_locales.each do |locale|
        context locale do
          before do
            I18n.locale = locale
          end
      
          it 'is rendered without error' do
            render_devise_i18n_view
          end
        end
      end
    end
  end

  describe 'capitalization special cases' do
    before do
      DeviseI18nViewsApp.view_to_render = 'devise/registrations/edit'
      allow(I18n).to receive(:load_path).and_return(Dir[Rails.root.join('rails', 'locales', '*.yml')])
    end

    it 'retains capitalization of German nouns' do
      I18n.locale = :de
      # This should be capitalized regardless because it's the start of the sentence...
      expect(render_devise_i18n_view).to include('User konnte aufgrund eines Fehlers nicht gespeichert werden:')
    end

    it 'downcases non-German nouns' do
      I18n.locale = :en
      expect(render_devise_i18n_view).to include('1 error prohibited this user from being saved:')
    end
  end
end

