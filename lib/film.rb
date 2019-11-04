class Film
  attr_reader :title, :director, :year

  def self.from_file(data_path)
    data_path.map do |film|
      content = File.readlines(film, encoding: 'UTF-8', chomp: true)
      new(content[0], content[1], content[2])
    end
  end

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year.to_i
  end

  def havnt?
    false
  end

  def to_s
    "#{director} - #{title} (#{year})"
  end
end
