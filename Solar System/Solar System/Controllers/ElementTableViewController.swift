//
//  ElementTableViewController.swift
//  Solar System Table
//
//  Created by Eoghan on 18/02/2022.
//

import UIKit

class ElementTableViewController: UITableViewController {
    
    //model data
    var solarSystemElementData : SolarSystemElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialise model data
        //solarSystemElementData = SolarSystemElement()
        solarSystemElementData = SolarSystemElement(xmlFileName: "ourSolarSystem.xml")
        tableView.backgroundView = UIImageView(image: UIImage(named: "stars.jpeg"))
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    // MARK: - Table view data source
   // override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    return "Our Solar System"
   // }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return solarSystemElementData.getCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        // Configure the cell...
        let solarSystemData = solarSystemElementData.getSolarSystem(index: indexPath.row)
        cell.textLabel?.text = solarSystemData.name
        cell.imageView?.image = UIImage(named : solarSystemData.image)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //find indexPath
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        // Get the new view controller using segue.destination.
        let destinationController = segue.destination as! ViewController
        
        // Pass the selected object to the new view controller.
        //destinationController.detailsData = solarSystemElementData.getSolarSystem(index: indexPath!.row)
        destinationController.index=indexPath?.row
    }
    

}
