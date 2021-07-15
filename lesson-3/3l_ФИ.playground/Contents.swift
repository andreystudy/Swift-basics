import Foundation

// MARK: - Enum

enum Action {
    case runEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadTrunk(_ volume: Int)
    case unloadTrunk(_ volume: Int)
}

// MARK: - TrunkCar

struct TrunkCar {
    var brand: String
    var year: Int
    var trunkVolume: Int
    var isEngineRunning: Bool
    var isWindowsOpen: Bool
    var isTrunkFullLoaded: Bool
    
    func describeAuto() {
        print("Грузовой автомобиль \(self.brand) \(self.year) года выпуска с объемом багажника \(self.trunkVolume) литров")
    }
    
    mutating func action(_ action: Action) {
        switch action {
        
        case .runEngine:
            isEngineRunning = true
            print("Двигатель \(self.brand) заведен")
        case .stopEngine:
            isEngineRunning = false
            print("Двигатель \(brand) остановлен")
        case .openWindows:
            isWindowsOpen = true
            print("Окна \(brand) открыты")
        case .closeWindows:
            isWindowsOpen = false
            print("Окна \(brand) закрыты")
        case .loadTrunk(let volume) where volume < self.trunkVolume:
            isTrunkFullLoaded = false
            let percent = (volume * 100) / self.trunkVolume
            print("Кузов \(brand) заполнен на \(percent) процентов")
        case .loadTrunk(let volume) where volume == self.trunkVolume:
            isTrunkFullLoaded = true
            print("Кузов \(brand) заполнен полностью")
        case .unloadTrunk(let volume) where volume < self.trunkVolume:
            isTrunkFullLoaded = false
            let percent = 100 - ((volume * 100) / self.trunkVolume)
            print("Кузов \(brand) заполнен на \(percent) процентов")
        case .unloadTrunk(let volume) where volume == self.trunkVolume:
            isTrunkFullLoaded = false
            print("Кузов \(brand) пустой")
        default:
            break
        }
    }
}

var ford = TrunkCar(brand: "Ford", year: 2000, trunkVolume: 1500, isEngineRunning: false, isWindowsOpen: false, isTrunkFullLoaded: false)
ford.describeAuto()
ford.action(.openWindows)
ford.action(.runEngine)
ford.action(.loadTrunk(1499))

var toyota = TrunkCar(brand: "Toyota", year: 2001, trunkVolume: 1800, isEngineRunning: true, isWindowsOpen: true, isTrunkFullLoaded: true)
toyota.action(.closeWindows)
toyota.action(.stopEngine)
toyota.action(.unloadTrunk(1500))


// MARK: - SportCar

struct SportCar {
    var brand: String
    var year: Int
    var trunkVolume: Int
    var isEngineRunning: Bool
    var isWindowsOpen: Bool
    var isTrunkFullLoaded: Bool
    
    func describeAuto() {
        print("Спортивный автомобиль \(self.brand) \(self.year) года выпуска с объемом багажника \(self.trunkVolume) литров")
    }
    
    mutating func action(_ action: Action) {
        switch action {
        
        case .runEngine:
            if isEngineRunning {
                print("Двигатель \(brand) уже заведен")
            } else {
                print("Двигатель \(brand) заведен")
            }
        case .stopEngine:
            if !isEngineRunning {
                print("Двигатель \(brand) уже остановлен")
            } else {
                print("Двигатель \(brand) остановлен")
            }
        case .openWindows:
            isWindowsOpen = true
            print("Окна \(brand) открыты")
        case .closeWindows:
            isWindowsOpen = false
            print("Окна \(brand) закрыты")
        case .loadTrunk(let volume) where volume < self.trunkVolume:
            isTrunkFullLoaded = false
            let percent = (volume * 100) / self.trunkVolume
            print("Багажник \(brand) заполнен на \(percent) процентов")
        case .loadTrunk(let volume) where volume == self.trunkVolume:
            isTrunkFullLoaded = true
            print("Багажник \(brand) заполнен полностью")
        case .loadTrunk(let volume) where volume > self.trunkVolume:
            isTrunkFullLoaded = true
            print("Багажник \(brand) не может вместить больше \(self.trunkVolume) литров")
        case .unloadTrunk(let volume) where volume < self.trunkVolume:
            isTrunkFullLoaded = false
            let percent = 100 - ((volume * 100) / self.trunkVolume)
            print("Багажник \(brand) заполнен на \(percent) процентов")
        case .unloadTrunk(let volume) where volume == self.trunkVolume:
            isTrunkFullLoaded = false
            print("Багажник \(brand) пустой")
        default:
            break
        }
    }
}

var honda = SportCar(brand: "Honda", year: 2019, trunkVolume: 300, isEngineRunning: false, isWindowsOpen: false, isTrunkFullLoaded: true)
honda.describeAuto()
honda.action(.openWindows)
honda.action(.stopEngine)
honda.action(.unloadTrunk(300))

var ferrari = SportCar(brand: "Ferrari", year: 2021, trunkVolume: 10, isEngineRunning: true, isWindowsOpen: true, isTrunkFullLoaded: false)
ferrari.describeAuto()
ferrari.action(.loadTrunk(100))
ferrari.action(.runEngine)
