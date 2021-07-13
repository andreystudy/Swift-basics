import Foundation

enum TransactionError: Error {
    case notEnoughFunds
    case serverError(error: Int)
    case unknown
}

struct Transaction {
    var count: Int
    var product: String
}

class TransactionPayment {
    
    var transactions = [
        "iPod" : Transaction(count: 600, product: "iPod"),
        "iPhone" : Transaction(count: 500, product: "iPhone"),
        "iPad" : Transaction(count: 400, product: "iPad"),
    ]
    
    var purchaseValume = 500
    var errorValue = 0
    
    func purchase(productNamed product: String, error: Int) throws {
        
        guard let transaction = transactions[product] else {
            throw TransactionError.unknown
        }
        
        guard transaction.count >= purchaseValume else {
            throw TransactionError.notEnoughFunds
        }
        
        guard error == 200 else {
            throw TransactionError.serverError(error: errorValue)
        }
        
        print("\(product) куплен за \(transaction.count)")
    }
}
 
let products = [
    "iPod" : "iPod",
    "iPhone" : "iPhone",
    "iPad" : "iPad"
]

func purchaseProduct(product: String, payment: TransactionPayment) throws {
    let serverMess = 200
    let iphone = products[product] ?? ""
    
    try payment.purchase(productNamed: iphone, error: serverMess)
}

do {
    try purchaseProduct(product: "iPhone", payment: TransactionPayment())
} catch TransactionError.notEnoughFunds{
    print("Not enough funds")
} catch TransactionError.serverError(error: let error) {
    print("\(error) status code")
} catch TransactionError.unknown {
    print("Unknown transation")
}
