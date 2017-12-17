class ApplicationController < ActionController::Base
  include LoadAndAuthorizeResource
  protect_from_forgery with: :exception
end
