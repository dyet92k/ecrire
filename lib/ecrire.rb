module Ecrire

  autoload :Application,        'ecrire/application'

  ##
  # Returns true if Ecrire could find 
  # a Gemfile in the current working directory
  #
  def self.bundle?
    ENV['BUNDLE_GEMFILE'] ||= Dir.pwd + '/Gemfile'
    File.exist?(ENV['BUNDLE_GEMFILE'])
  end

  if Ecrire.bundle?
    require 'bundler/setup'
    require 'rails/all'

    require 'jbuilder'
    require 'bourbon'
    require 'sass-rails'
    require 'sprockets'
    require 'coffee-rails'
    require 'turbolinks'

    Bundler.require(:required, :server, Rails.env)
  else
    require 'rails/all'
  end
end
