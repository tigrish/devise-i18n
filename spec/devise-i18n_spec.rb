require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

Dir.glob('config/locales/*.yml').each do |locale_file|
  describe "a devise-i18n #{locale_file} locale file" do
    it_behaves_like 'a valid locale file', locale_file
    it { expect(locale_file).to be_a_subset_of 'config/locales/en.yml' }
  end
end
