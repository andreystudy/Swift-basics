
// MARK: - Функция, которая определяет, четное число или нет

func evenOrOdd(number: Int) -> String {
    if number % 2 == 0 {
        return "Число \(number) четное"
    } else {
        return "Число \(number) нечетное"
    }
}

print(evenOrOdd(number: 96))

// MARK: - Функция, которая определяет, делится ли число без остатка на 3

func divide(number: Int) -> String {
    if number % 3 == 0 {
        return "Число \(number) делится на 3 без остатка"
    } else {
        return "Число \(number) не делится на 3 без остатка"
    }
}

print(divide(number: 7))

// MARK: - Возрастающий массив из 100 чисел

var array: [Int] = []

for i in 0...99 {
    array.append(i)
}
print(array)

// MARK: - Удалить из этого массива все четные числа и все числа, которые не делятся на 3

var newArray: [Int] = []

for number in array {
    if number % 2 != 0 && number % 3 == 0 {
        newArray.append(number)
    }
}
print(newArray)

// MARK: - Функция, которая добавляет в массив новое число Фибоначчи, и добавляет 50 элементов

func createFibonacciArray(count n: Int) -> [Int] {
    var array: [Int] = [0, 1]
    for index in 2...n {
        array.append(array[index - 1] + array[index - 2])
    }
    
    return array
}

print(createFibonacciArray(count: 50))

// MARK: - Массив из 100 элементов различными простыми числами

func findPrimeNumbers(in array: [Int]) -> [Int] {
    var primeNumbers: [Int] = []
    var newArray = array

    while let p = newArray.first {
        primeNumbers.append(p)
        newArray = newArray.filter { $0 % p != 0}
    }

    return primeNumbers
}

print(findPrimeNumbers(in: Array(2...99)))


