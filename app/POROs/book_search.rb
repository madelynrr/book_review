class BookSearch

  def initialize(title)
    @title = title
  end

  def book_title
    book_information.title
  end

  def book_author
    book_information.author
  end

  def book_information
    book_response = Faraday.get("http://openlibrary.org/search.json?title=#{@title}")
    book_information = JSON.parse(book_response.body, symbolize_names: true)
    @book = Book.new(book_information)
  end



end
