# PhotoBook

## Enviroment
```
Ruby 2.1.3
MySql
```

## Setup
```
git clone https://github.com/roman-dubrovsky/PhotoBookApp
bundle install
config/database.yml
rake db:setup
```

## TO.DO.

gem "simple_form"

####Devise
```
Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
```
