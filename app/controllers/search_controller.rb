class SearchController < ApplicationController
  def search
    render({ :template => "search/home.html.erb"})
  end

  def index
  end

  def show
  end
end