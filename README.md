# devise-i18n

[![CI](https://github.com/tigrish/devise-i18n/actions/workflows/ci.yml/badge.svg)](https://github.com/tigrish/devise-i18n/actions/workflows/ci.yml)

[Devise](https://github.com/plataformatec/devise) "is a flexible authentication solution for Rails based on Warden". Internationalization (aka i18n) is a "means of adapting computer software to different languages, regional differences and technical requirements of a target market".

Devise supports i18n in controllers, models, and in other areas, but it does not have support for internationalized views. devise-i18n adds this support. Devise also does not include the actual translations. devise-i18n does this too.

## Installation

Add to your Gemfile:
```ruby
gem 'devise-i18n'
```

Assuming you have _not_ previously generated Devise's views into your project, that's all you need to do. If you _have_ previously done this, you will need to regenerate your views (see "Customizing views" below) and then reapply whatever customizations that made you do this in the first place.

## Setting your locale

You will need to set a locale in your application as described in the [Rails Internationalization Guide](https://guides.rubyonrails.org/i18n.html).

If you are setting the locale per request (because your application supports multiple locales), the suggested code in that guide (using `I18n.with_locale` inside an `around_action`) will not work properly with devise-i18n. Due to [a bug in warden](https://github.com/wardencommunity/warden/issues/180), some error messages will not be translated. Instead, you can set the locale in a `before_action`:

```ruby
before_action do
  I18n.locale = :es # Or whatever logic you use to choose.
end
```

or in middleware:

```ruby
class LocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    I18n.locale = :es # Or whatever logic you use to choose.
    status, headers, body = @app.call(env)
  end
end
```
```ruby
config.middleware.use ::LocaleMiddleware
```

## Customizing views

The `devise:i18n:views` generator will copy all devise-i18n's views to your application so that you can modify the files as you wish.

``` sh
rails g devise:i18n:views
```
You should only do this if you really need to, though, because doing this will make it so that you won't get the updated views should they change in a future version of devise-i18n. To "uncustomize" the views, just delete them, and your app will go back to grabbing devise-i18n's default views.

If you have ```simple_form``` in your Gemfile, this command will generate the corresponding views using the simple_form form builder.

## Scoped views

If you need to use scoped views (for example, if you have different ones for users and admins), you can include the scope in this command.
``` sh
rails g devise:i18n:views user
```

You will additionally need to generate the translations into your app per the following section and then add keys in each file for the scope you are using.

## Customizing translations

If, for whatever reason, you want to change devise-i18n's translations, you can generate the locale file into your project with 
``` sh
rails g devise:i18n:locale it
```

which will generate `config/locales/devise.views.it.yml`. If you're doing this to add a missing translation or to improve an existing one, it'd be nice if you could share your suggestions with us!


## Contributing translations to devise-i18n

Edit the translations directly on the [devise-i18n](https://app.localeapp.com/projects/377) project on Locale. **That's it!**
The maintainer will periodically pull translations from the Locale project and push to GitHub.

Alternately, you can create a pull request on GitHub.

In general, the tone of translations should be friendly, polite, and succinct. Certain languages (including Japanese and Korean) should use a more formal tone which is the standard for customer messages in those languages.

## Copyright

Copyright (c) 2011 Christopher Dell. See LICENSE.txt for
further details.
