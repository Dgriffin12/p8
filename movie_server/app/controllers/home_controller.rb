class HomeController < ApplicationController
  def index
  end

  def search

	if @reviews == nil
		redirect_to root_url
		notice("No match found for <%params[:search]%>")
	else
		redirect_to review
	end
  end
end
