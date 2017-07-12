require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/cakes_controller.rb'

run CakesController