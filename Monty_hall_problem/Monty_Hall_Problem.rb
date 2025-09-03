require 'securerandom'
require 'gruff'

# Функция без изменения двери
def monty_hall_without_change(choices)
  choices.shuffle!
  return choices[SecureRandom.random_number(choices.length)]
end

# Функция с изменением двери
def monty_hall_with_change(choices)
  choices.shuffle!
  first_choice = SecureRandom.random_number(choices.length)

  # Ведущий открывает дверь с козлом
  host_choice = nil
  choices.each_with_index do |val, i|
    if i != first_choice && val == 'k'
      host_choice = i
      break
    end
  end

  # Второй выбор (другая дверь)
  choices.each_with_index do |val, i|
    return val if i != first_choice && i != host_choice
  end
end

choices = ['k', 'k', 'a']
N = 100_000

# Без изменения двери
win_count = 0
N.times do
  win_count += 1 if monty_hall_without_change(choices) == 'a'
end
p_without_change = (win_count.to_f / N).round(3)

# С изменением двери
win_count = 0
N.times do
  win_count += 1 if monty_hall_with_change(choices) == 'a'
end
p_with_change = (win_count.to_f / N).round(3)

puts "Вероятность выиграть без изменения двери #{p_without_change}"
puts "Вероятность выиграть c изменением двери #{p_with_change}"

# График
g = Gruff::Bar.new
g.title = "Распределение вероятности выигрыша"
g.labels = {0 => "Без изменения двери", 1 => "С изменением двери"}
g.data(:Без_изменения, [p_without_change])
g.data(:С_изменением, [p_with_change])
g.write('monty_hall_ruby.png')
