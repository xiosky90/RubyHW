p "Дано число А и натуральное число N. Найти результат следующего выражения 1 + А + А*2 + А*3 + … + А*N."
p "arr.inject(1 + A + A * 2 - A * 3) { |v| v + (-1**N) * A *N }"
arr = [1, 2, 3, 4, 5]
A = 2
N = 4
p arr.inject(1 + A + A  2 - A * 3) { |v| v + (-1**N) * A * N }