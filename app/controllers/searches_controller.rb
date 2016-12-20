class SearchesController < ApplicationController
  def create
    @search = Sunspot.search search_models(search_params[:type]) do
                fulltext search_params[:query]
              end
    @results = @search.results

    render :index
  end

  def index

  end

  private
  def search_models(type)
    case type
    when "bands"
      return Band
    when "albums"
      return Album
    when "tracks"
      return Track
    else
      return [Band, Album, Track]
    end
  end

  def search_params
    params.require(:search).permit(:query, :type)
  end
end
