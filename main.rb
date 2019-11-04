# Программа "Фильм на вечер"

require_relative 'lib/film'

files = Dir["#{__dir__}/data/*.txt"]

films = Film.from_file(files)

directors = films.map(&:director).uniq

puts 'Программа "Фильм на вечер"'
puts

directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
user_choise = STDIN.gets.to_i

if user_choise <= directors.size
  result = films.select do |film|
    film.director == directors[user_choise - 1]
  end.sample
  puts 'И сегодня вечером рекомендую посмотреть:'
  puts result
else
  puts "Введите число в диапазоне от 1 до #{directors.size}!"
end
