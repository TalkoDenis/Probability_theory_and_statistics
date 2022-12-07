#!/usr/bin/env python
# coding: utf-8

# In[1]:


import random


# In[2]:


def monty_hall_without_change(choices):
    # В начале каждой попытки случайно перемешаем массив
    random.shuffle(choices)
    return choices[random.randrange(len(choices))]


# In[5]:


def monty_hall_with_change(choices):
    # В начале каждой попытки случайно перемешаем массив
    random.shuffle(choices)
    # Первый выбор
    first_choice = random.randrange(len(choices))
    # Ведущий открывает дверь с козлом
    for i in range(len(choices)):
        if i != first_choice and choices[i] == 'к':
            host_choice = i
            break
    # Делаем второй выбор, меняя первое решение
    for i in range(len(choices)):
        if i != first_choice and i != host_choice:
            return choices[i]


# In[7]:


# К - козел, а - автомобиль
choices = ['к', 'к', 'а']
# Просто калое-либо большое число (количество опытов)
N = 100000

# Проверяем вариант с неизменным выбором
win_count = 0
for _ in range(N):
    result = monty_hall_without_change(choices)
    if result == 'а':
        win_count += 1
# Вероятность выиграть - частота выигранных опытов
print('Вероятность выиграть без изменения двери')
print(win_count/N)

# Проверяем вариант с изменением выбора
win_count = 0
for _ in range(N):
    result = monty_hall_with_change(choices)
    if result == 'а':
        win_count += 1
# Вероятность выиграть - частота выигранных опытов
print('Вероятность выиграть с изменением двери')
print(win_count/N)

