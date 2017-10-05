class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb '<i class="fa fa-home fa-lg" aria-hidden="true"></i>'.html_safe, :root_path
end
