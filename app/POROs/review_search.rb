class ReviewSearch
  attr_reader :title
  def initialize(title)
    @title = title
  end

  def reviews
    conn = Faraday.new(url: "https://api.nytimes.com/") do |faraday|
      faraday.params['api-key'] = ENV['NYT_API_KEY']
      faraday.params['title'] = title
    end

    review_response = conn.get("svc/books/v3/reviews.json")

    parsed_reviews = JSON.parse(review_response.body, symbolize_names: true)[:results]

    parsed_reviews.map do |review|
      review[:summary]
    end
  end
end
