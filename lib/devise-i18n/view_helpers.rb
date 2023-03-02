module DeviseI18n
  module ViewHelpers
    # Custom logic to fix case for different strings and languages.
    def devise_i18n_fix_model_name_case(text, i18n_key:)
      # In general, on errors.messages.not_saved, downcase, but German nouns are always capitalized.
      return text.downcase if i18n_key == 'errors.messages.not_saved' && I18n.locale.to_s != 'de'

      text
    end
  end
end
