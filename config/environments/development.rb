Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Config of email reminder / notifcations for the stockNote app  
  #  Instructions from:
  #  1. https://medium.com/@ericschwartz7/rails-mailer-tutorial-82700f6737d9
  #  ^^ THIS IS WHERE I GOT MY INSTRUCTIONS SPECIFICALLY FROM  - in section 5. Configuration for gmail 
  #  2. https://medium.com/@dflores_89085/using-actionmailer-with-react-redux-822e0b575dc3


  # config.action_mailer.delivery_method = :sendmail
  # # Defaults to:
  # # config.action_mailer.sendmail_settings = {
  # #   location: '/usr/sbin/sendmail',
  # #   arguments: '-i'
  # # }
  # config.action_mailer.perform_deliveries = true
  # config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.default_options = {from: 'postmaster@sandboxb52a1e5cf8994003a598480c0a28f42b.mailgun.org'}
 

  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
    api_key: ENV['MG_API_KEY'],
    domain: ENV['MG_DOMAIN']
  }



  #  Part 2 of config. for google
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  # address:              'smtp.gmail.com',
  # port:                  25,
  # # port:                 587, - trying port 25 - potentirails ally less security issues?
  # domain:               'example.com',   # this would typically be my domain... but perhaps I don't need to include this???
  # user_name:            ENV['STOCK_NOTE_EMAIL'],
  # password:             ENV['STOCK_NOTE_PW'],
  # authentication:       'plain',
  # enable_starttls_auto: true  }

  
end
