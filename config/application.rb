require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PQBApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets')
    Rails.application.config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif )

    config.i18n.default_locale = :ja

    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
  end
end
