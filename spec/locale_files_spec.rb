require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

Dir.glob('rails/locales/*.yml').each do |locale_file|
  RSpec.describe "a devise-i18n #{locale_file} locale file" do
    # zh-YUE is not a valid ISO locale code, but it's what is used by rails-i18n.
    if locale_file != 'rails/locales/zh-YUE.yml'
      it_behaves_like 'a valid locale file', locale_file
    end
    it { expect(locale_file).to be_a_subset_of 'rails/locales/en.yml' }
  end
end
