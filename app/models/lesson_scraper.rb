require_relative '../../config/environment'
require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.app_host = 'http://www.google.com'

class LearnScraper
  include Capybara::DSL

  attr_accessor :session, :email, :password, :url

  def s
    @session ||= Capybara::Session.new(:poltergeist)
  end

  LOGIN_URL = 'https://learn.co/sign_in?sign_in=true'

  def access_url
    s.visit url
    if s.has_content? "Login"
      log_in
      s.visit url # gets us back to the lesson, logged in.
    end
  end

  def log_in # delivers us to the user's home page
    s.visit LOGIN_URL
    s.fill_in 'Email Address', with: @email
    s.fill_in 'Password', with: @password
    s.click_on 'Sign in'
  end
end
