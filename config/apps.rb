##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount("blog").to('/blog')
#   Padrino.mount("blog", :app_class => "BlogApp").to('/blog')
#   Padrino.mount("blog", :app_file =>  "path/to/blog/app.rb").to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount("Admin").host("admin.example.org")
#   Padrino.mount("WebSite").host(/.*\.?example.org/)
#   Padrino.mount("Foo").to("/foo").host("bar.example.org")
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount("AppName", :app_file => "path/to/file", :app_class => "BlogApp").to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  set :asset_host, ENV['ASSET_HOST'] if Padrino.env == :production           
  set :asset_uri_root, "/" 
  set :stylesheets_path, 'css' 
  set :javascripts_path, 'js'
end

# Mounts the core application for this project
Padrino.mount("DbdDocs").to('/')      
Padrino.mount("DbdApiDocs",  :app_file => "#{Padrino.root}/app_api/app.rb").to("/apidocs") if Padrino.env == :development      
Padrino.mount("DbdApiDocs",  :app_file => "#{Padrino.root}/app_api/app.rb").to("/").host("api_docs.designbreakdown.com") if Padrino.env == :production