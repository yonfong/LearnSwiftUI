//
//  Order.swift
//  CupcakeCorner
//
//  Created by sky on 2024/3/11.
//

import Foundation
import Observation

struct Address: Codable {
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}


@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var deliveryAddress = Address() {
        didSet {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(deliveryAddress)
                
                UserDefaults.standard.set(data, forKey: "deliveryAddress")
            } catch {
                print("Failed to save deliveryAddress to UserDefaults: \(error.localizedDescription)")
            }
        }
    }
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        if let addressData = UserDefaults.standard.data(forKey: "deliveryAddress") {
            if let decodedAddress = try? JSONDecoder().decode(Address.self, from: addressData) {
                deliveryAddress = decodedAddress
                return
            }
        }
        deliveryAddress = Address()
    }
}
