require 'film'

RSpec.describe Film do
  before(:all) do
    files = Dir["#{__dir__}/fixtures/*.txt"]
    @films = Film.from_file(files)
    @titles = @films.map(&:title)
    @directors = @films.map(&:director)
    @years = @films.map(&:year)
  end

  describe '::from_file' do
    it 'returns an array' do
      p @films
      expect(@films).to be_a(Array)
    end
  end

  describe '.new' do
    it 'is return instance of class Film' do
      expect(Film.new(@titles[0], @directors[0], @years[0])).to be_an_instance_of(Film)
    end

    context 'assigns instance variables' do
      it 'returns movie\'s title in an array' do
        expect(@titles).to match_array(['Побег из Шоушенка', 'Джокер'])
      end

      it 'returns movie\'s director in an array' do
        expect(@directors).to match_array(['Тодд Филлипс', 'Фрэнк Дарабонт'])
      end

      it 'returns movie\'s relise year in an array' do
        expect(@years).to match_array([1994, 2019])
      end
    end
  end

  describe '#to_s' do
    it 'converts film info to string' do
      expect(@films.map(&:to_s)).to match_array(
        ['Тодд Филлипс - Джокер (2019)',
         'Фрэнк Дарабонт - Побег из Шоушенка (1994)']
      )
    end
  end
end
