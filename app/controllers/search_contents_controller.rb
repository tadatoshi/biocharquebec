class SearchContentsController < ApplicationController
  respond_to :html

  def index
    @search_contents = SearchContent.search(params[:query])
    @query = params[:query]

    respond_with(@search_contents)
  end

end