wisdomsun
=========

Wisdom Sun 

Notes
=========
```
ImageMagick
To be able to upload images using redactor
Need to run
sudo apt-get install imagemagick
then go to config/environments/development.rb
add
Paperclip.options[:command_path] = "/usr/bin/"

SQLITE3
  attach 'db/asdf.sqlite' as db;
  .help
  .stats ON #for stats 
  .header ON  # for headers 

ActiveAdmin
  Registering new model (creates app/admin/model_name.rb)
    rails generate active_admin:resource [modelname]
      
      
heroku env vars
  heroku config:set KEY=VALUE

Redactor-Rails
  follow instructions
  add shit to application.js/css/rb

ActiveAdmin + Redactor
  add //= require redactor-rails to top of active_admin.js
  add to top of active_admin.css:
    /*
     *= require redactor-rails
    */
    // Fix redactor-rails, 90% solution, the last 10% isn't worth it to me.
    body.active_admin form.formtastic .redactor_box {
      margin-left: 20%;
      border: 1px solid #C9D0D6;
      -webkit-border-radius: 3px;
      -moz-border-radius: 3px;
      border-radius: 3px;
      width: 76%;
    }

  then use f.input :contents, input_html:{class: 'redactor'}

Redactor + Paperclip
  using gem "redactor-rails-paperclip"

Unescape html tags
  use simple_format("<p>text</p>")
```
