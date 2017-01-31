require 'rspec'
require 'page-object'
require 'pry'
require 'fileutils'
require 'watir'
require 'rest-client'
require 'json'
require 'selenium-webdriver'
require 'uri'
require 'net/http'
require 'httparty'
require 'faker'

require_relative '../support/config/configuration'
require_relative '../support/config/page_object'

PROJECT_DIR      ||= File.expand_path(File.dirname(__FILE__) + '../../..')

Fixtures.load_config("#{PROJECT_DIR}/config/config.yml")

World(PageObject::PageFactory)


