import Foundation

// MARK: - Car
class Car {
    var brand: String
    var model: String
    var year: Int
    var isEngineRunning: Bool
    
    enum Action {
        case runEngine
        case stopEngine
        case loadTrunk(_ volume: Int)
        case unloadTrunk(_ volume: Int)
        case driveFast(_ speed: Int)
        case drift
    }
    
    init(brand: String, model: String, year: Int, isEngineRunning: Bool) {
        self.brand = brand
        self.year = year
        self.model = model
        self.isEngineRunning = isEngineRunning
    }
        
    func decribeAction() {}
    
    func action(_ action: Action) {}
}

// MARK: - TrunkCar
class TrunkCar: Car {
    var trunkVolume: Int
    var isTrunkFullLoaded: Bool
    
    init(brand: String, model: String, year: Int, isEngineRunning: Bool, trunkVolume: Int, isTrunkFullLoaded: Bool) {
        self.trunkVolume = trunkVolume
        self.isTrunkFullLoaded = isTrunkFullLoaded
        print("\(brand) \(model) с максимальным объемом багажника \(trunkVolume)")
        
        super.init(brand: brand, model: model, year: year, isEngineRunning: isEngineRunning)
    }
    
    override func action(_ action: Car.Action) {
        switch action {
        
        case .runEngine:
            isEngineRunning = true
            print("\(brand) заведен")
        case .stopEngine:
            isEngineRunning = false
            print("\(brand) заглушен")
        case .loadTrunk(let volume) where volume > trunkVolume:
            isTrunkFullLoaded = true
            print("Кузов \(brand) не может вместить больше \(trunkVolume) литров")
        case .loadTrunk(let volume) where volume == trunkVolume:
            isTrunkFullLoaded = true
            print("Кузов \(brand) заполнен полностью")
        case .loadTrunk(let volume) where volume < trunkVolume:
            isTrunkFullLoaded = false
            let percent = (volume * 100) / self.trunkVolume
            print("Кузов \(brand) заполнен на \(percent) процентов")
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

// MARK: - SportCar
class SportCar: Car {
    var maxSpeed: Int
    var timeTo100: Double
    var isAcceleratedToMax: Bool
    var isInDrift: Bool
    
    init(brand: String, model: String, year: Int, isEngineRunning: Bool, maxSpeed: Int, timeTo100: Double, isAcceleratedToMax: Bool, isInDrift: Bool) {
        self.maxSpeed = maxSpeed
        self.isAcceleratedToMax = isAcceleratedToMax
        self.isInDrift = isInDrift
        self.timeTo100 = timeTo100
        print("\(brand) \(model) разгоняется до максимальной скорости 100 км/ч за \(timeTo100) секунд")
        
        if isInDrift {
            print("\(model) вошел в дрифт")
        } else {
            print("\(model) вышел из дрифта")
        }
        
        super.init(brand: brand, model: model, year: year, isEngineRunning: isEngineRunning)
    }
    
    override func action(_ action: Car.Action) {
        switch action {
        
        case .runEngine:
            isEngineRunning = true
            print("\(brand) заведен")
        case .stopEngine:
            isEngineRunning = false
            print("\(brand) заглушен")
        case .driveFast(let speed) where speed == maxSpeed:
            isAcceleratedToMax = true
            print("\(model) разогнался до максимальной скорости \(speed) км/ч")
        case .driveFast(let speed) where speed < maxSpeed:
            isAcceleratedToMax = false
            print("\(model) набрал скорость \(speed) км/ч")
        case .drift:
            if isInDrift {
                isInDrift = false
                print("\(model) вышел из дрифта")
            } else {
                isInDrift = true
                print("\(model) вошел в дрифт")
            }
        default:
            break
        }
    }
}

// MARK: - Action

var mitsubishi = SportCar(brand: "Mitsubishi", model: "Evo", year: 2018, isEngineRunning: true, maxSpeed: 252, timeTo100: 0.9, isAcceleratedToMax: false, isInDrift: true)
mitsubishi.action(.drift)
mitsubishi.action(.driveFast(200))
mitsubishi.action(.driveFast(mitsubishi.maxSpeed))

var ford = TrunkCar(brand: "Ford", model: "F200", year: 2020, isEngineRunning: true, trunkVolume: 1800, isTrunkFullLoaded: true)
ford.action(.stopEngine)
ford.action(.unloadTrunk(ford.trunkVolume))
