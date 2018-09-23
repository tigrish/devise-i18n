require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

IGNORED_AS_VALID_LOCALES = [
  'zh-YUE', # zh-YUE is not a valid ISO locale code, but it's what is used by rails-i18n.
  'pap-AW', # Not in ISO-639-1, but in ISO-693-2. i18n-spec does not include it.
  'pap-CW', # Not in ISO-639-1, but in ISO-693-2. i18n-spec does not include it.
].map{|locale| "rails/locales/#{locale}.yml" }

Dir.glob('rails/locales/*.yml').each do |locale_file|
  RSpec.describe "a devise-i18n #{locale_file} locale file" do
    it_behaves_like 'a valid locale file', locale_file unless IGNORED_AS_VALID_LOCALES.include?(locale_file)
    it { expect(locale_file).to be_a_subset_of 'rails/locales/en.yml' }
  end
end
