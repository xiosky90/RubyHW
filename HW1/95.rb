p "Дан целочисленный массив и число К. Вывести количество элементов, меньших К."
p "arr.find_all { |v| v < k}.length"

arr = [22, 44, 55, 66, 6, 5, 7, 2, 1, 8, -1, -100]
k = 33
p arr.find_all { |v| v < k}.length