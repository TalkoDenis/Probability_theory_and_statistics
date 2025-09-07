def luhn(card)
  checksum = 0
  card_numbers = card.chars.map(&:to_i)
  card_numbers.each_with_index do |num, count|
    if count % 2 == 0
      buffer = num * 2
      if buffer > 9
        buffer -= 9
      end
      checksum += buffer
    else
      checksum += num
    end
  end
  if checksum % 10 == 0
    puts "Номер карты #{card} - корректный!"
  else
    puts "Номер карты #{card} - некорректный!"
  end
end

puts 'Введите номер карты! Номер должен состоять из 16 цифр!'
card = gets.chomp

if card.length == 16 && card.match?(/^\d+$/)
  luhn(card)
else
  puts 'Номер введён некорректно!'
end
