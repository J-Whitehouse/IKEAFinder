//
//  IKEADataStore.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/20/21.
//

import UIKit

class IKEADataStore {
    
    // This line denotes our class as a singleton
    static let sharedInstance = IKEADataStore()
    
    //creates empty array of IKEA objects
    var allIKEAs = [IKEA]()
    
    init() {
    
        let a = IKEA(storeName: "Budapest",
                            storeNumber: 180,
                            storeImage: "ikea_cardiff",
                            address: "Örs Vezer Tere",
                            city: "Budapest",
                            zipCode: "1148",
                            country: "Hungary",
                            telephone: "3614603100",
                            size: 25174,
                            roomSettings: 0,
                            realLifeHomes: 0,
                            cashLanes: 23,
                            restaurantSeating: 507,
                            smaland: false,
                            webpage: "http://www.ikea.com/hu/hu/store/budapest",
                            latitude: 47.504323,
                            longitude: 19.135221)
        
        
        let b = IKEA(storeName: "Bursa",
                            storeNumber: 220,
                            storeImage: "ikea_cardiff",
                            address: "Yeni Yalova Yolu Uzeri",
                            city: "Bursa",
                            zipCode: "16220",
                            country: "Turkey",
                            telephone: "902242708500",
                            size: 24501,
                            roomSettings: 54,
                            realLifeHomes: 3,
                            cashLanes: 19,
                            restaurantSeating: 854,
                            smaland: true,
                            webpage: "http://www.ikea.com.tr/Magaza/Genel/2.aspx",
                            latitude: 40.267024,
                            longitude: 29.055337)
        
        
        let c = IKEA(storeName: "Bydgoszcz",
                            storeNumber: 429,
                            storeImage: "ikea_cardiff",
                            address: "ul. Skandynawska 1",
                            city: "Bydgoszcz",
                            zipCode: "85-776",
                            country: "Poland",
                            telephone: "",
                            size: 0,
                            roomSettings: 0,
                            realLifeHomes: 0,
                            cashLanes: 0,
                            restaurantSeating: 410,
                            smaland: true,
                            webpage: "",
                            latitude: 53.1324,
                            longitude: 18.1194)
        
        
        let d = IKEA(storeName: "Cadiz (Jerez de la Frontera)",
                            storeNumber: 277,
                            storeImage: "ikea_cardiff",
                            address: "Tienda IKEA Avenida de Escandinavia S/N",
                            city: "Jerez de la Frontera",
                            zipCode: "11408",
                            country: "Spain",
                            telephone: "34956359100",
                            size: 32312,
                            roomSettings: 52,
                            realLifeHomes: 3,
                            cashLanes: 30,
                            restaurantSeating: 525,
                            smaland: true,
                            webpage: "http://www.ikea.com/es/es/store/jerez",
                            latitude: 36.6968573,
                            longitude: -6.1615238)
        
        
        let e = IKEA(storeName: "Caen",
                            storeNumber: 199,
                            storeImage: "ikea_cardiff",
                            address: "Rue De Suisse Normande 970",
                            city: "Fleury Sur Orne",
                            zipCode: "14123",
                            country: "France",
                            telephone: "",
                            size: 29225,
                            roomSettings: 55,
                            realLifeHomes: 2,
                            cashLanes: 29,
                            restaurantSeating: 545,
                            smaland: true,
                            webpage: "",
                            latitude: 49.145586,
                            longitude: -0.364059)
        
        
        let f = IKEA(storeName: "Cairo",
                            storeNumber: 258,
                            storeImage: "ikea_cardiff",
                            address: "Cairo Festival City",
                            city: "New Cairo",
                            zipCode: "",
                            country: "Egypt",
                            telephone: "",
                            size: 0,
                            roomSettings: 0,
                            realLifeHomes: 0,
                            cashLanes: 25,
                            restaurantSeating: 667,
                            smaland: true,
                            webpage: "",
                            latitude: 30.03005226,
                            longitude: 31.40740156)
        
        
        let g = IKEA(storeName: "Calgary",
                            storeNumber: 216,
                            storeImage: "ikea_cardiff",
                            address: "11Th Street S.E.  8000",
                            city: "Calgary",
                            zipCode: "T2H3B2",
                            country: "Canada",
                            telephone: "14035382406",
                            size: 27029,
                            roomSettings: 40,
                            realLifeHomes: 3,
                            cashLanes: 35,
                            restaurantSeating: 450,
                            smaland: true,
                            webpage: "http://www.ikea.com/ca/en/store/calgary",
                            latitude: 50.980876,
                            longitude: -114.043121)

        allIKEAs += [a,b,c,d,e,f,g]
        print(allIKEAs.count)
    
    }
}
