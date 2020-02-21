class SearchController < ApplicationController

  def index
    title = params[:title]

    conn = Faraday.new(url: "https://api.nytimes.com/") do |faraday|
      faraday.params['api-key'] = ENV['NYT_API_KEY']
      faraday.params['title'] = title
    end

    review_response = conn.get("svc/books/v3/reviews.json")

    parsed_reviews = JSON.parse(review_response.body, symbolize_names: true)[:results]

    @reviews = parsed_reviews.map do |review|
      review[:summary]
    end

    book_response = Faraday.get("http://openlibrary.org/search.json?title=#{title}")
    @book = JSON.parse(book_response.body, symbolize_names: true)
  end

end
