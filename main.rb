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

until (1..directors.size).include?(user_choise = STDIN.gets.to_i)
  puts "Введите число в диапазоне от 1 до #{directors.size}!"
end

result = films.select do |film|
  film.director == directors[user_choise - 1]
end.sample

puts 'И сегодня вечером рекомендую посмотреть:'
puts result
