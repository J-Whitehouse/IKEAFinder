//
//  IKEA+CoreDataProperties.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 10/4/21.
//
//

import Foundation
import CoreData


extension IKEA {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IKEA> {
        return NSFetchRequest<IKEA>(entityName: "IKEA")
    }

    @NSManaged public var address: String?
    @NSManaged public var cashLanes: Int16
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var realLifeHomes: Int16
    @NSManaged public var restaurantSeating: Int16
    @NSManaged public var roomSettings: Int16
    @NSManaged public var size: Int16
    @NSManaged public var smaland: Bool
    @NSManaged public var storeImage: String?
    @NSManaged public var storeName: String?
    @NSManaged public var storeNumber: Int16
    @NSManaged public var telephone: String?
    @NSManaged public var webpage: String?
    @NSManaged public var zipCode: String?
    
    public var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    public var title: String? {
        get {
            return storeName
        }
    }

}

extension IKEA : Identifiable {

}
