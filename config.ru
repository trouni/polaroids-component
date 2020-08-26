require 'sinatra'
require 'sass/plugin/rack'
require './app'

Sass::Plugin.options.merge! css_location: 'public/css', template_location: 'stylesheets',
                            debug_info: true, style: :compressed
use Sass::Plugin::Rack

run App