class Book

  attr_reader :title, :author, :genres

  def initialize(attributes)
    @title = attributes[:docs].first[:title]
    @author = attributes[:docs].first[:author_name].first

  end
end
