require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ImageOpt
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.aws = {:region => ENV['AWS_REGION'], :bucket => ENV['AWS_BUCKET'], :cloudfront_distribution_id => ENV['AWS_CLOUDFRONT_DISTRIBUTION_ID']}
    config.aws_creds = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    config.aws_image = {:acl => ENV['AWS_IMAGE_ACL'] || 'public-read', :metatag => ENV['AWS_IMAGE_METATAG'] || 'img_optim', :cachecontrol => ENV['AWS_IMAGE_CACHE_CONTROL'] || 'max-age=315576000'}

    config.assets.image_optim = false

    # Code is not reloaded between requests.
    config.cache_classes = true

    # Eager load code on boot. This eager loads most of Rails and
    # your application in memory, allowing both threaded web servers
    # and those relying on copy on write to perform better.
    # Rake tasks automatically ignore this option for performance.
    config.eager_load = true

    # Use the lowest log level to ensure availability of diagnostic information
    # when problems arise.
    config.log_level = :error

    # Use default logging formatter so that PID and timestamp are not suppressed.
    config.log_formatter = ::Logger::Formatter.new
  end
end