# Текст и количество символов, на которое сдвигаем
def encrypt(text, shift)
  result = ""
  text.each_char do |char|
    if char.match?(/[[:alpha:]]/)
      ascii_offset = char.downcase == char ? 'a'.ord : 'A'.ord
      encrypted_char = ((char.ord - ascii_offset + shift) % 26 + ascii_offset).chr
      result += encrypted_char
    else
      result += char
    end
  end
  result
end

puts "Введите текст на английском. Текст не должен содержать цифры и знаки препинания:"
text = gets.chomp

# Буквы и пробелы с помощью регулярного выражения!
until text.match?(/\A[[:alpha:] ]+\z/)
  puts "Введен некорректный текст. Введите текст на английском:"
  text = gets.chomp
end

puts "Введите смещение (целое число):"
shift = gets.chomp

until shift.match?(/\A\d+\z/)
  puts "Введен некорректный сдвиг. Введите целое число:"
  shift = gets.chomp
end

shift = shift.to_i

encrypted_text = encrypt(text, shift)
puts "Зашифрованный текст: #{encrypted_text}"