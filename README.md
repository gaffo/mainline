Mainline
========

Mainline is a rails plugin which exposes your rails app via webrick to allow
testing with browser automators such as Selenium or Watir. Mainline allows
your rails actions to run in the same transaction as your unit tests so you
can use fixtures, factories, or whatever.

Currently mainline only supports one integration session at a time.

To install it as a plugin:

    script/plugins install git://github.com/gaffo/mainline.git

And to enable it you need to do a:

Mainline.enable, or the block form (if you need to configure things).

For example, to enable Mainline and specify a port:

    Webrat.configure do |config|
      config.mode = :rails
      config.open_error_files = false # Set to true if you want error pages to pop up in the browser
      Mainline.enable { |config| config.port = 3030 }
    end
    
When using webrat, it's best to do somthing like this if you are just running selenium.

    Webrat.configure do |config|
      config.application_framework = :external
      Mainline.enable
    end

However if you need to run in selenium and non selenium and need to configure 
ports (for build boxes), you should use somthing like this (pulled from my own config):

    Webrat.configure do |config|
      if ENV['WEBRAT_INTEGRATION_MODE'] == 'selenium'
      	config.mode = :selenium
        config.application_framework = :external
        config.application_port = ENV['WEBRAT_APPLICATION_PORT'] || 3001
        config.selenium_server_port = ENV['WEBRAT_SELENIUM_PORT'] || 4444
        Mainline.enable do |mainline_config|
          mainline_config.port = ENV['WEBRAT_APPLICATION_PORT'] || 3001
        end
      else
      	config.mode = :rails
      end
    end


Links
=====

Code: http://github.com/gaffo/mainline
Docs: http://rdocul.us/repos/mainline/master/index.html
Bugs: http://gaffo.lighthouseapp.com/projects/24578-mainline/overview