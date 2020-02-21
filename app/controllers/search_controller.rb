class SearchController < ApplicationController

  def index
    render locals: {
      book_results: BookSearch.new(params[:title]),
      review_results: ReviewSearch.new(params[:title])
    }
  end

end
