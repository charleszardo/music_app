class SearchesController < ApplicationController
  def create
    
    @search = Sunspot.search [Band, Album, Track] do
                fulltext params[:search]
              end
    p @search
    @results = @search.results

    render :index
  end

  def index

  end
end
