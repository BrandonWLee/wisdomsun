wisdomsun
=========

Wisdom Sun 

Notes
=========
```

File Attachment (Paperclip gem)
  -requires ImageMagick to be installed on system
    -see below
    -for Heroku, use rmagick gem (?? dw about it)
  -also uses Paperclip-Storage-FTP gem because regular Paperclip has no FTP
User Sign in/on (Devise gem)
Admin Dashboard (Active Admin gem)
Rich Text Formatting (with picture and file attachment) (Redactor-Rails-Paperclip gem)
  -for some reason not working on Firefox in Ubuntu (haven't tried outside Ubuntu)
  -really buggy on Chromium in Ubuntu
  -seems okay on Chrome on Windows 7 
  -looks like a Javascript/Jquery problem, maybe

Validation Checking in Admin
  checks admin form against model validation and specifies which fields are invalid
  rails plugin install git://github.com/redinger/validation_reflection.git


ImageMagick (for Paperclip)
  To install, need to run
    sudo apt-get install imagemagick
    then go to config/environments/development.rb
      add 
      Paperclip.options[:command_path] = "/usr/bin/"

ActiveAdmin
  To register a model under ActiveAdmin (assuming you made the model already) 
    rails generate active_admin:resource [modelname]
    (creates app/admin/model_name.rb)
  AA gives you default way to view and edit a resource on dashboard
    But you can add stuff to app/admin/model_name.rb for customization 

Set Heroku environment variables (for password and shit)
  heroku config:set KEY=VALUE

Heroku log (+ postgresql log)
  heroku logs -p postgres -t

Unescape html tags
  use simple_format("<p>text</p>")
  or rather html_safe("<p>text</p>")
    simple_format seems to get rid of style

SQLITE3
  attach 'db/asdf.sqlite' as db;
  .help
  .stats ON #for stats 
  .header ON  # for headers 








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



```
