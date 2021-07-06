// MARK: - Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct Queue<Element> {
    var items = [Element]()
    
    mutating func add(_ item: Element) {
        items.append(item)
    }
    
    mutating func next() -> Element {
        return items.removeFirst()
    }
    
    // Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    
    mutating func filter(_ function: (Element) -> Bool) -> [Element] {
        var newArray = [Element]()
        
        for i in items {
            if function(i) {
                newArray.append(i)
            }
        }
        return newArray
    }
    
    mutating func map<T>(_ function: (Element) -> T) -> [T] {
        var newArray = [T]()
        
        for i in items {
            newArray.append(function(i))
        }
        
        return newArray
    }
    
    // * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
    subscript(index: Int) -> Element? {
        index < items.count ? items[index] : nil
    }
}

var intQueue = Queue<Int>()
intQueue.add(1)
intQueue.add(2)
intQueue.add(3)
intQueue.add(4)
intQueue.add(5)
intQueue.add(6)
intQueue.add(7)
intQueue.add(8)
intQueue.add(9)

print(intQueue)

intQueue.next()
print(intQueue)

let filtredIntQueue = intQueue.filter { item in
    return item % 2 == 1
}
print(filtredIntQueue)

let mappedIntQueue = intQueue.map { item in
    return item * 2
}
print(mappedIntQueue)

print(intQueue[11])


var stringQueue = Queue<String>()
stringQueue.items = ["17", "18", "19", "20", "21", "22"]

stringQueue.add("23")
print(stringQueue)

stringQueue.next()
print(stringQueue)

let filtred = stringQueue.filter {$0.contains("9")}
print(filtred)
let mapped = stringQueue.map {"2021-07-" + $0 }
print(mapped)
