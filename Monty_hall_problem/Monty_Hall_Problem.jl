using Random
using Statistics
using Plots

# Без изменения двери
function monty_hall_without_change(choices)
    shuffle!(choices)
    return choices[rand(1:length(choices))]
end

# С изменением двери
function monty_hall_with_change(choices)
    shuffle!(choices)
    first_choice = rand(1:length(choices))

    host_choice = 0
    for i in 1:length(choices)
        if i != first_choice && choices[i] == 'k'
            host_choice = i
            break
        end
    end

    for i in 1:length(choices)
        if i != first_choice && i != host_choice
            return choices[i]
        end
    end
end

choices = ['k', 'k', 'a']
N = 100_000

# Без изменения двери
wins = count(_ -> monty_hall_without_change(copy(choices)) == 'a', 1:N)
p_without_change = round(wins / N, digits=3)

# С изменением двери
wins = count(_ -> monty_hall_with_change(copy(choices)) == 'a', 1:N)
p_with_change = round(wins / N, digits=3)

println("Вероятность выиграть без изменения двери $p_without_change")
println("Вероятность выиграть c изменением двери $p_with_change")

# График
bar(["Без изменения двери", "С изменением двери"],
    [p_without_change, p_with_change],
    label = ["Без изменения" "С изменением"],
    color = [:red :blue],
    ylabel = "Процент вероятности выигрыша",
    title = "Распределение вероятности выигрыша")
