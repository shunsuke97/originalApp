require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module OriginalApp
  class Application < Rails::Application
    # rails gコマンドで生成される不要ファイルを削除
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
