# config.ru
require './app'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

run InsuranceDataApp