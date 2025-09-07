def Luhn(card):
    checksum = 0
    cardnumbers = list(map(int, card))
    for count, num in enumerate(cardnumbers):
        if count % 2 == 0:
            buffer = num * 2
            if buffer > 9:
                buffer -= 9
            checksum += buffer
        else:
            checksum += num

    if checksum % 10 == 0:
      print(f'Номер карты {card} - корректный!')
    else:
      print(f'Номер карты {card} - некорректный!')

card = input('Введите номер карты! Номер должен состоять из 16 цифр!')

if len(card) == 16 and card.isdigit() == True:
  Luhn(card)
else:
  print('Номер введён некорректно!')

