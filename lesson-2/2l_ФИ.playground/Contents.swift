
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


// MARK: - Фибоначчи массив 2 версия (сделано после просмотра разбора преподавателем)

func fibonacci(count: Int) -> [Int] {
    var array: [Int] = []
    switch count {
    case 1:
        let f0: Int = 0
        array.append(f0)
        return array
    case 2:
        let f0: Int = 0
        let f1: Int = 1
        array.append(f0)
        array.append(f1)
        return array
    default:
        let f0: Int = 0
        let f1: Int = 1
        array.append(f0)
        array.append(f1)
        
        var n = 2
        while n < count + 2 {
            let n1 = array[n - 1] + array[n - 2]
            array.append(n1)
            n += 1
        }
        return array
    }
}

print(fibonacci(count: 50))

// MARK: - Массив из 100 элементов различными простыми числами вариант 2 (сделано после просмотра разбора преподавателем)

func isMultiple(_ num: Int, divider: Int) -> Bool {
    return num % divider == 0
}

var integers: [Int] = []

while integers.count != 10 {
    integers.append(integers.count + 2)
}

print(integers)

var p: Int
var index = 0

while index < integers.count - 1 {
    p = integers[index]
    
    for num in integers {
        print("num = \(num) ---- p = \(p)")
        if num != p && isMultiple(num, divider: p) {
            integers.remove(at: integers.firstIndex(of: num)!)
        }
    }
    index += 1
}

print(integers)
