//
//  ViewController.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/20/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var storeName: UILabel!
    @IBOutlet var Address: UILabel!
    @IBOutlet var City: UILabel!
    @IBOutlet var ZIP: UILabel!
    @IBOutlet var Telephone: UILabel!
    @IBOutlet var StoreNumber: UILabel!
    @IBOutlet var Country: UILabel!
    @IBOutlet var Size: UILabel!
    @IBOutlet var RoomSettings: UILabel!
    @IBOutlet var RealLifeHomes: UILabel!
    @IBOutlet var CashLanes: UILabel!
    @IBOutlet var RestaurantSeating: UILabel!
    @IBOutlet var Smaland: UILabel!
    @IBOutlet var Webpage: UILabel!
    @IBOutlet var StoreImage: UILabel!
    
    var selectedIKEA: IKEA!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: Assign to outlets
        storeName.text = "Storename: " + selectedIKEA.storeName
        Address.text = "Address: " + selectedIKEA.address
        City.text = "City: " + selectedIKEA.city
        ZIP.text = "Zip: " + selectedIKEA.zipCode
        Telephone.text = "Telephone: " + selectedIKEA.telephone
        StoreNumber.text = "StoreNumber: " + String(selectedIKEA.storeNumber)
        Country.text = "Country: " + selectedIKEA.country
        Size.text = "Size: " + String(selectedIKEA.size)
        RoomSettings.text = "Room Settings: " + String(selectedIKEA.roomSettings)
        RealLifeHomes.text = "Real Life Homes: " + String(selectedIKEA.realLifeHomes)
        CashLanes.text = "Cash Lanes: " + String(selectedIKEA.cashLanes)
        RestaurantSeating.text = "Restaurant Seating: " + String(selectedIKEA.restaurantSeating)
        Smaland.text = "Smaland: " + String(selectedIKEA.smaland)
        Webpage.text = "Webpage: " + selectedIKEA.webpage
        StoreImage.text = "Store Image: " + selectedIKEA.storeImage
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IKEASingleMapSegue" {
            
            let singleMapVC = segue.destination as! SingleMapViewController
            
            singleMapVC.selectedIKEA = selectedIKEA
        }
    }
    

}

