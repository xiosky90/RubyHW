p "Дан целочисленный массив. Найти количество минимальных элементов."
p "arr.select {|v| v == arr.min }.size"

arr = [22, 44, 55, -100, 66, -6, 5, 7, -2, 1, 55, 8, -1, 44, -100, 55]
p arr.select {|v| v == arr.min }.size