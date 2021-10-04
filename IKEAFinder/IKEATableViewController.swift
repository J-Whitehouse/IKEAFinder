//
//  IKEATableViewController.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/20/21.
//

import UIKit

class IKEATableViewController: UITableViewController {
    
    var IKEABucket: IKEADataStore!
    
    // MARK: TableView Datasource Methods (2 required)
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Maximum number of cells possible in table view
        return IKEABucket.allIKEAs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Create and instance of UITableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as! IKEACell
        
        //set the text on the cell with the name of the store
        let item = IKEABucket.allIKEAs[indexPath.row]        
        
        cell.locationName.text = item.storeName
        cell.City.text = item.city
        if (item.smaland == true) {
            cell.smalandImage.image = UIImage(named: "SmalandIcon")
        }
        
        return cell
    }
    
    //MARK: Event Lifecycle functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Populate core data
        IKEABucket.populateCoreData()
    }
    
    //MARK: Select IKEA
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check to see if this is the correct seque
        if segue.identifier == "IKEADetailSegue" {
            
            //Get a reference to the viewcontroller tha the segue leads to
            let detailView = segue.destination as! DetailViewController
            
            //figure out which cell was clicked
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                //Find the specific IKEA in the array
                let selectedIKEA = IKEABucket.allIKEAs[indexPath.row]
                
                detailView.selectedIKEA = selectedIKEA
            }
        }
    }
}

