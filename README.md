# devise-i18n

[![Build Status](https://secure.travis-ci.org/tigrish/devise-i18n.png)](http://travis-ci.org/tigrish/devise-i18n)

[Devise](https://github.com/plataformatec/devise) "is a flexible authentication solution for Rails based on Warden". Internationalization (aka i18n) is a "means of adapting computer software to different languages, regional differences and technical requirements of a target market".

Devise supports i18n in controllers, models, and in other areas, but it does not have support for internationalized views. devise-i18n adds this support. Devise also does not include the actual translations. devise-i18n does this too.

devise-18n is for devise v2 and later. For devise v1.5, use the **[devise-1.5 branch](https://github.com/tigrish/devise-i18n/tree/devise-1.5)**.


## Installation

Add to your Gemfile:
```ruby
gem 'devise-i18n'
```

Assuming you have _not_ previously generated Devise's views into your project, that's all you need to do. If you _have_ previously done this, you will need to regenerate your views (see the next section) and then reapply whatever customizations that made you do this in the first place.


## Customizing views

The `devise:views:i18n_templates` generator will copy all devise-i18n's views to your application so that you can modify the files as you wish.

``` sh
rails g devise:views:i18n_templates
```
You should only do this if you really need to, though, because doing this will make it so that you won't get the updated views should they change in a future version of devise-i18n. To "uncustomize" the views, just delete them, and your app will go back to grabbing devise-i18n's default views.


## Customizing translations

If, for whatever reason, you want to change devise-i18n's translations, you can generate the locale file into your project with 
``` sh
rails g devise:views:locale it
```

which will generate `config/locales/devise.it.yml`. If you're doing this to add a missing translation or to improve an existing one, it'd be nice if you could share your suggestions with us!


## Contributing translations to devise-i18n

- Edit the translations directly on the [devise-i18n](http://www.localeapp.com/projects/377) project on Locale.
- **That's it!**
- The maintainer will then pull translations from the Locale project and push to Github.

Happy translating!

## Copyright

Copyright (c) 2011 Christopher Dell. See LICENSE.txt for
further details.
