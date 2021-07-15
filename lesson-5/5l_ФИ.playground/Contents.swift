import Foundation

// MARK: - Enums
enum EngineType {
    case on
    case off
}

enum WindowsType {
    case opened
    case closed
}

enum Drift {
    case enter, out
}

// MARK: - Protocols
protocol Car: AnyObject {
    var model: String {get}
    var engineType: EngineType {get set}
    var windowsType: WindowsType {get set}
}

protocol Trunk: Car {
    var trunkVolume: Int {get}
}

protocol Sport: Car {
    var maxSpeed: Int {get}
    var drifting: Drift {get set}
}

extension Car {
    func switchEngine(_ type: EngineType) {
        switch type {
        case .on:
            engineType = .on
            print("\(model) заведен")
        case .off:
            engineType = .off
            print("\(model) заглушен")
        }
    }
    
    func switchWindows(_ type: WindowsType) {
        switch type {
        case .opened:
            windowsType = .opened
            print("Окна \(model) открыты")
        case .closed:
            windowsType = .closed
            print("Окна \(model) закрыты")
        }
    }
}

extension Trunk {
    func loadTrunk(volume: Int) {
        let percentOfFull = (100 * volume) / trunkVolume
        if volume < trunkVolume {
            print("Кузов \(model) заполнен на \(percentOfFull) процентов")
        } else {
            print("Кузов \(model) заполнен полностью")
        }
    }
    
    func unloadTrunk(volume: Int) {
        let percentOfFull = 100 - ((100 * volume) / trunkVolume)
        if volume < trunkVolume {
            print("Кузов \(model) заполнен на \(percentOfFull) процентов")
        } else {
            print("Кузов \(model) пуст")
        }
    }
}

extension Sport {
    func accelerateToMax(speed: Int) {
        if speed == maxSpeed {
            print("\(model) разогнался до максимальных \(maxSpeed) км/ч")
        } else {
            print("\(model) разогнался до \(speed) км/ч")
        }
    }
    
    func drift(_ action: Drift) {
        switch action {
        
        case .enter:
            self.drifting = .enter
            print("\(model) вошел в дрифт")
        case .out:
            self.drifting = .out
            print("\(model) вышел из дрифта")
        }
    }
}


// MARK: - Classes

class TrunkCar: Trunk {
    var trunkVolume: Int
    var model: String
    var engineType: EngineType
    var windowsType: WindowsType
    
    init(model: String, trunkVolume: Int) {
        self.model = model
        self.trunkVolume = trunkVolume
        self.engineType = .off
        self.windowsType = .closed
    }
}

class SportCar: Sport {
    var maxSpeed: Int
    var drifting: Drift
    var model: String
    var engineType: EngineType
    var windowsType: WindowsType
    
    init(model: String, maxSpeed: Int) {
        self.model = model
        self.maxSpeed = maxSpeed
        self.drifting = .out
        self.engineType = .off
        self.windowsType = .closed
    }
}

// MARK: - CustomStringConvertible
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузвой автомобиль \(model) c объемом кузова \(trunkVolume)"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль \(model) с максимальной скоростью \(maxSpeed)"
    }
}

// MARK: - Calling

let ford = TrunkCar(model: "F200", trunkVolume: 1800)
print(ford.description)
ford.switchEngine(.on)
ford.switchWindows(.opened)

let mazda = SportCar(model: "RX7", maxSpeed: 254)
print(mazda.description)
mazda.switchEngine(.on)
mazda.switchWindows(.opened)
mazda.drift(.enter)
mazda.drift(.out)
mazda.accelerateToMax(speed: 254)








