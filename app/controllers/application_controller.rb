require 'geoip'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def ip
  	request.ip
  end

  def current_geolocation_data
  	GeoIP.new('GeoLiteCity.dat').city(ip)
  end
	
	def authenticate
	  authenticate_or_request_with_http_basic do |username, password|
	    username == "admin" && password == "haslohaslo"
	  end
	end
end
