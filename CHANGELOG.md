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
