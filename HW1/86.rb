p "Дан целочисленный массив. Найти среднее арифметическое его элементов."
p "arr.reduce(:+) / (arr.size - 1)"
arr = [22, 44, 55, 66 , 6, 5, 7 ,2 , 1, 8]
p arr.reduce(:+) / (arr.size - 1)