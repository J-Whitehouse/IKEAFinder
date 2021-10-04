//
//  IKEADataStore.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/20/21.
//

import UIKit
import CoreData

class IKEADataStore {
    
    // This line denotes our class as a singleton
    static let sharedInstance = IKEADataStore()
    
    //creates empty array of IKEA objects
    var allIKEAs = [IKEA]()
    
    init() {
    
        allIKEAs = self.fetchAllStores()   
    }
    
    func fetchAllStores()-> [IKEA] {
        var ikeaStores: [IKEA] = [IKEA]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [IKEA]()
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<IKEA>(entityName: "IKEA")
        
        //Execute the query
        do {
            let fetchedIKEAStores = try managedContext.fetch(fetchRequest)
            for singleStore in fetchedIKEAStores {
                ikeaStores.append(singleStore)
            }
        } catch {
            print("Could not fetch.")
        }
        
        return ikeaStores
    }
    
    // MARK: Utilities to write JSON to Core Data
        // Create a struct that will allow us to map JSON objects to Core Data objects
        struct IKEAstruct:Codable {
            let storeName: String?
            let storeNumber: Int?
            let storeImage: String?
            let address: String?
            let city: String?
            let zipCode: String?
            let country: String?
            let telephone: String?
            let size: Int?
            let roomSettings: Int?
            let realLifeHomes: Int?
            let cashLanes: Int?
            let restaurantSeating: Int?
            let smaland: Int?
            let webpage: String?
            let latitude: Double?
            let longitude: Double?
        }
        
        func populateCoreData() {
            let defaults = UserDefaults.standard
            
            if (defaults.string(forKey: "isFirstLaunch") != nil) {
                
            } else {
                defaults.set(true, forKey: "isFirstLaunch")
                
                do {
                    try IKEADataStore.sharedInstance.writeJSONToCoreData(filename: "ikeastores")
                } catch {
                    print(error)
                }
            }
        }
        
        func writeJSONToCoreData(filename: String) throws {
            guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
                fatalError("File not found")
            }
            
            do {
                let fileData = try Data(contentsOf: file)
                
                do {
                    let ikeaList = try [IKEAstruct].Decode(data: fileData)
                    
                    for ikeaElement in ikeaList {
                        saveToCoreData(structElementForDB: ikeaElement)
                    }
                } catch {
                    print(error)
                }
            } catch {
                print(error)
            }
            
        }
        
        func  saveToCoreData(structElementForDB: IKEAstruct) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "IKEA", in: managedContext)!
            
            let ikeaCD = NSManagedObject(entity: entity, insertInto: managedContext)
            
            ikeaCD.setValue(structElementForDB.storeName, forKey:"storeName")
            ikeaCD.setValue(structElementForDB.storeNumber, forKey:"storeNumber")
            ikeaCD.setValue(structElementForDB.storeImage, forKey:"storeImage")
            ikeaCD.setValue(structElementForDB.address, forKey:"address")
            ikeaCD.setValue(structElementForDB.city, forKey:"city")
            ikeaCD.setValue(structElementForDB.zipCode, forKey:"zipCode")
            ikeaCD.setValue(structElementForDB.country, forKey:"country")
            ikeaCD.setValue(structElementForDB.telephone, forKey:"telephone")
            ikeaCD.setValue(structElementForDB.size, forKey:"size")
            ikeaCD.setValue(structElementForDB.roomSettings, forKey:"roomSettings")
            ikeaCD.setValue(structElementForDB.realLifeHomes, forKey:"realLifeHomes")
            ikeaCD.setValue(structElementForDB.cashLanes, forKey:"cashLanes")
            ikeaCD.setValue(structElementForDB.restaurantSeating, forKey:"restaurantSeating")
            ikeaCD.setValue(convertToBool(intToConvert: structElementForDB.smaland), forKey:"smaland")
            ikeaCD.setValue(structElementForDB.webpage, forKey:"webpage")
            ikeaCD.setValue(structElementForDB.latitude, forKey:"latitude")
            ikeaCD.setValue(structElementForDB.longitude, forKey:"longitude")
            
            print(structElementForDB.storeName)
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save.\(error), \(error.userInfo)")
            }
            
        }
        
        func convertToBool(intToConvert: Int?) -> Bool {
            var boolValue = false
            if let unwrappedInt = intToConvert {
                boolValue = Bool(truncating: unwrappedInt as NSNumber)
            }
            return boolValue
        }
}


//MARK: Encoder and decoder for JSON
extension Encodable {
    func Encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

extension Decodable {
    static func Decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
