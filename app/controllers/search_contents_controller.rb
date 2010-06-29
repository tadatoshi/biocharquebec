class SearchContentsController < ApplicationController
  respond_to :html

  def index
    @search_contents = SearchContent.search_in_current_locale(params[:query])
    @query = params[:query]

    respond_with(@search_contents)
  end

end