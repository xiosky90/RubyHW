p "Дан целочисленный массив. Найти количество его локальных минимумов."
p "arr.select.with_index { |value, i| arr[i - 1] > value && value < arr[i + 1] }.length"
arr = [23, 13, 25, 29, 33, 19, 34, 45, 65, 67]
p arr.select.with_index { |value, i| arr[i - 1] > value && value < arr[i + 1] }.length