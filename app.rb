require 'bundler'
Bundler.require
$:.unshift File.expand_path('lib', __dir__)

require 'controller'
require 'gossip'
require 'router'
require 'view'

Router.new.perform
