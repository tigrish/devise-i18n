## 1.11.0

- Updated views for devise 4.9 per:
  - https://github.com/heartcombo/devise/commit/f08e0ad24aa6fec6f585247c0465e0d46c6d8a94
  - https://github.com/heartcombo/devise/commit/88625d488f43bfc804b3c63437b463e71e9211b5
  - https://github.com/heartcombo/devise/commit/49ed129c4057569761278467ea2ab331223a1b80
- Adjust how the resource name is looked up in registrations/edit.html.erb to match devise's lookup.

## 1.10.3

- Updated ar (Arabic), es (Spanish), es-CO (Spanish - Columbia), es-MX (Spanish - Mexico), fr (French), th (Thai), and uk (Ukrainian) translations.
- Added es-CL (Spanish - Chile) and eo (Esperanto) translation.
- Fixed a bug with relative paths when creating scoped views - https://github.com/tigrish/devise-i18n/pull/318

## 1.10.2

- Updated es, hr, it, nl, pt-BR, and th translations.

## 1.10.1

- Updated es-MX, fr, he, nb, no, pl, pt-BR, vi translations.

## 1.10.0

- Updated views for devise 4.8 as per https://github.com/heartcombo/devise/pull/5331. These changes are required to work with Omniauth v2 per https://github.com/heartcombo/devise/pull/5327, so if you generated views into your app (for customization), you should update or regenerate them.
- Updated an English string per https://github.com/heartcombo/devise/pull/5315.
- Updated id and tr translations.

## 1.9.4

- Updated de, el, fr, ja, sq, sr, and sr-RS translations.

## 1.9.3

- Use a different message in email changed notification if email is unconfirmed. This is what devise does, but was missed here previously.
- Updated de, de-CH, fi, fr, fr-CA, and ja translations.

## 1.9.2

- Updated es, es-MX, fr, it, pt-BR, and ru translations.

## 1.9.1

- Updated he, ko, nb, pl, pt-BR, sv, and tr translations.

## 1.9.0

- Updated views for devise 4.7 as per https://github.com/plataformatec/devise/pull/5054. Any views generated into your app prior to this release of devise-i18n should continue to work.
- Added km translation.
- Updated de, en, es, fa, and ja translations.

## 1.8.2

- Updated ja, pt-BR, zh-CN, and zh-TW translations.

## 1.8.1

- Added es-CO and mk translations.
- Updated cs, de, de-CH, es, fr, id, ru, tr, and zh-TW translations.

## 1.8.0

- Updated views for devise 4.6 as per https://github.com/plataformatec/devise/pull/4616. If you generated the views into your app (for customization), you may receive deprecation warnings until you regenerate or update your views.
- Added en-US string for devise 4.6 per https://github.com/plataformatec/devise/pull/4569. This string has not yet been translated to other locales.
- Require devise 4.6 and above.

## 1.7.2

- Added hi translation.
- Updated pl translation.

## 1.7.1

- Fixed syntax error in simple_form templates.
- Updated fr, ru, sk, and sq translations.

## 1.7.0

- Add pluralizations of `activerecord.models.user` to allow it be used in other contexts. If you previously referenced this translation directly with `I18n.t`, you will now need to pass in a `count` parameter.
- Update views to match devise 4.5.0. Any views generated into your app prior to this release of devise-i18n should continue to work.
- Require devise 4.5 and above.
- Updated views and English strings so the rendered views exactly match devise.
- Fixed edit registration view to use translated model name.
- Updated de, en-GB, en, es-MX, es, fr, it, ja, and pt translations.

## 1.6.5

- Added pap-AW and pap-CW translations.
- Updated az, es, ko, lv, pl, uk, vi, zh-CN, and zh-TW translations.

## 1.6.4

- Fixes a file permission problem introduced in 1.6.3.

## 1.6.3

- Updated fa, fr, it, ja, pt-BR, ro, th, uk, and zh-HK translations.

## 1.6.2

- Updated ar, ca, da, de, es, es-MX, fr, is, it, lv, ro, and ru translations.

## 1.6.1

- Added sq translation.
- Updated cs, de-CH, es, fr, ja, nl, sv, zh-CN, and zh-TW translations.

## 1.6.0

- Updated views to match those in devise 4.4.0. Any views generated into your app prior to this release of devise-i18n should continue to work. 
- Added and updated English strings to match those in devise 4.4.0.
- Require devise 4.4 and above.
- Updated nl translation.

## 1.5.1

- Devise looks up a different key on login failure if the user exists. This can be used by other users to determine if specific user is already registered, even if Devise is in paranoid mode (which normally tries to prevent this). This has been filed as [devise issue #4763](https://github.com/plataformatec/devise/issues/4763). Updated some translations that were using different strings for these keys to mitigate the issue.
- Updated de, el, es, et, fa, ja, nl, pl, pt-BR, ru, si, sv, vi, and zh-CN translations.

## 1.5.0

- Require devise 3.4 and above.
- Updated error keys to use the devise-configured authentication keys instead of always "email" or translated equivalent (feature introduced in [devise#3201](https://github.com/plataformatec/devise/issues/3201)).
- Added si translation.
- Updated de, el, fi, fr, pl, pt-BR, zh-CN, and zh-TW translations.

## 1.4.0

- Add a requirement for devise 3.1 and above.
- Removed backwards compatibility for mailer tokens for devise versions before 3.1.0. Any views generated into your app prior to this release of devise-i18n should continue to work. If, for some reason, you are otherwise calling `DeviseI18n::ViewHelpers` methods (`resource_confirmation_token`, `resource_reset_password_token`, and `resource_unlock_token`), you will need to replace these calls with `@token`.
- Update ja translation.

## 1.3.0

- Added a requirement for devise 2 and above. This is in preparation for upping the minimum devise version in a future release to support updated text in devise.
- Fix reset_password_token for devise 4. #150
- Added tl and ur translations.
- Updated ar, fr, fr-CA, it, ja, ko, ms, nb, nn-NO, no, pt-BR, zh-CN, and zh-TW translations.

## 1.2.0

- Made all possible attribute names from all devise modules localizable.
- Added es, ha, ig, lo-LA, yo, and zh-YUE translations.
- Updated bg, cs, de, es-MX, fr-CA, ja, ka, nl, pt-BR, sk, sl, zh-CN, and zh-TW translations.
- Corrected Malay locale code (from my to ms).

## 1.1.2

- Updated en-GB, fi, ko, nl, pl, pt, pt-BR, ru, uk, and zh-TW translations.
- Added ka translation.

## 1.1.1

- Updated ar, bg, ca, da, de, de-CH, en, es, es-MX, fr, it, nb, pt-BR, ru, and sv translations.
- Added af and be translations.
- Fixed generation of simple_form-enabled views.

## 1.1.0

- Support for devise 4.
- Added new translated strings from devise - reset_password_token and unlock_token.
- Renamed generators to a more semantic namespace.
- Generating views will generate simple_form-enabled views if simple_form is installed.
- Update views to better match devise's views.
- Updated cs, de, de-CH, es, es-MX, et, fi, fr-CA, id, pl, ro, ru, and tr translations.
- Added nn-NO translation.

## 1.0.1

- Updated translations for es-MX, es, fr, pt-BR, ru, and uk.

## 1.0.0

- Code and translations from [devise-i18n-views](https://github.com/mcasimir/devise-i18n-views) has been merged into devise-i18n. This means that devise-i18n will now also include i18n for the views that devise provides. You will no longer need devise-i18n-views going forward.
