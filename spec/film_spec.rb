require 'film'

RSpec.describe Film do
  before(:all) do
    files = Dir["#{__dir__}/fixtures/*.txt"]
    @films = Film.from_file(files)
  end

  context 'Тест чтения из файла' do
    it 'Должен возвращать объекты класса Array' do
      expect(@films.map(&:title)).to be_an_instance_of(Array)
      expect(@films.map(&:director)).to be_an_instance_of(Array)
      expect(@films.map(&:year)).to be_an_instance_of(Array)
    end

    it 'Должен возвращать названия фильмов в массиве' do
      expect(@films.map(&:title)).to eq ['Джокер', 'Побег из Шоушенка']
    end

    it 'Должен возвращать имена режиссеров в массиве' do
      expect(@films.map(&:director)).to eq ['Тодд Филлипс', 'Фрэнк Дарабонт']
    end

    it 'должен возвращать год издания фильмов в массиве' do
      expect(@films.map(&:year)).to eq [2019, 1994]
    end
  end

  context 'Присвоение инстанс-переменных в классе' do
    it 'Должен возвращать инстанс переменные класса' do
      @films.each do |film|
        expect(film.title).to eq('Джокер').or eq('Побег из Шоушенка')
        expect(film.director).to eq('Тодд Филлипс').or eq('Фрэнк Дарабонт')
        expect(film.year).to eq(2019).or eq(1994)
      end
    end
  end
end
