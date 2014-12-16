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

## Test
```
rspec
```

## Preproduction
```
uncomment uploader tests
clear unnecessary files
change routes
```

## TO.DO.

#### HomePage
#### Avatar and user info on profile(and in my page)
#### Add footer
#### Add static page
#### Added descriptions to album_photo_settings
#### added back button

#### Coments
```
  1. Infinite scrolling 
  2. Can edit
  3. Lenghth
```

#### Photos#index
```
  1. New photo block
  2. Sexy design
  3. Drog&Drup upload
  4. Multy upload
  5. js
```  

#### Photos#show & album_photo#show load
```
  1. photos#show like album_photo#show
  2. Alax loads and modal window
  3. Menu
```  

#### Albums#edit
```
  1. Drug&drop
  2. Uploads photo
```

#### Slideshow
```
  1. Number
```

#### only image uploading
#### add validation
#### Hide buttons

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
