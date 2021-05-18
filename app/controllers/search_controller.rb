class SearchController < ApplicationController
  def search
    render({ :template => "search/search.html.erb"})
  end

  def index
  end

  def show
  end
end