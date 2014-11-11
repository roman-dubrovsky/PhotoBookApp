# PhotoBook

## Requirements
```
Ruby 2.1.3
MySql
RMagick
```

## Setup
```
git clone https://github.com/roman-dubrovsky/PhotoBookApp
bundle install
config/database.yml
cp config/cloudinary.yml.example config/cloudinary.yml
rake db:setup
```

## TO.DO.

#### Photos#index
```
  1. New photo block
  2. Sexy design
  3. Drog&Drup upload
  4. Multy upload
  5. js
```  

#### Photos#show
```
  1. Sexy nagigation
  2. Sexy design
  3. Alax loads
  4. js
  5. Add to album
```  

#### Albums#index
```
  1. js
  2. Sexy design
```

#### Albums#show
```
  1. js
  2. Sexy design
```

#### Albums#index
```
  1. js
  2. Sexy design
  3. Sexy header
  4. Uploader
```

#### Albums#show
```
  1. Photo#show
  2. Description
```

#### Albums#edit
```
  1. js
  2. Sexy design
  3. Drug&drop
```

#### db dump

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
