class WelcomeController < ApplicationController
	layout 'landing'
	include SkipAuthorized
	def index
	end
end
