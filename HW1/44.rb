p "Дан целочисленный массив. Найти максимальный нечетный элемент."
p "arr.select{|v| v.odd?}.max"

arr = [22, 44, 55, -100, 55, -6, 5, 7, -2, 1, 55, 8, -1, 44, -100, 55]
p arr.select{|v| v.odd?}.max