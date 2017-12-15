class DashboardController < ApplicationController
  def index
  	@articles = Article.search params.try(:[], :query), :sql => {:include => :user}, :page => params[:page], :per_page => 20
  end
end
