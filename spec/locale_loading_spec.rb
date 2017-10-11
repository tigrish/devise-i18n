# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Locale loading' do
  let(:app) do
    DeviseI18n::Spec::FakeApp
  end

  let(:translate_stuff) do
    lambda do
      <<-EOS.gsub(/^  */, '')
        In Arabic: #{I18n.t('devise.failure.locked', locale: :ar)}
        In Azerbajani: #{I18n.t('devise.failure.locked', locale: :az)}
        In Bulgarian: #{I18n.t('devise.failure.locked', locale: :bg)}
      EOS
    end
  end

  context 'when i18n.available_locales are specified in config' do
    let(:translations) do
      app.run(translate_stuff) do |config|
        config.i18n.available_locales = [:ar, :az]
      end
    end

    it 'loads only specified locales' do
      expected_translations = <<-EOS.gsub(/^  */, '')
        In Arabic: تم غلق حسابك.
        In Azerbajani: Sizin hesabınız bloklanmışdır.
        In Bulgarian: translation missing: bg.devise.failure.locked
      EOS

      expect(translations).to eq(expected_translations)
    end
  end

  context 'when single locale is assigned to i18n.available_locales' do
    let(:translations) do
      app.run(translate_stuff) do |config|
        config.i18n.available_locales = 'ar'
      end
    end

    it 'loads only this locale' do
      expected_translations = <<-EOS.gsub(/^  */, '')
        In Arabic: تم غلق حسابك.
        In Azerbajani: translation missing: az.devise.failure.locked
        In Bulgarian: translation missing: bg.devise.failure.locked
      EOS

      expect(translations).to eq(expected_translations)
    end
  end

  context 'when i18n.available_locales is not set' do
    let(:translations) { app.run(translate_stuff) }

    it 'loads all locales' do
      expected_translations = <<-EOS.gsub(/^  */, '')
        In Arabic: تم غلق حسابك.
        In Azerbajani: Sizin hesabınız bloklanmışdır.
        In Bulgarian: Профилът Ви е заключен.
      EOS

      expect(translations).to eq(expected_translations)
    end
  end
end
