//
//  DetailsViewController.swift
//  Solar System App
//
//  Created by Eoghan on 11/02/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //model data
    var detailsData : SolarSystem!

    //outlets and actions
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBAction func exploreButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // data is pushed over the segue
        
        // populate the outlets
        imageLabel.image        = UIImage(named: detailsData.image)
        nameLabel.text          = detailsData.name
        factLabel.text          = detailsData.fact
        diameterLabel.text      = detailsData.diameter
        speedLabel.text         = detailsData.orbitalSpeed
        
        distanceLabel.text      = detailsData.distFromSun
        
        
        factLabel.layer.borderWidth = 2.0
        factLabel.layer.borderColor = UIColor.white.cgColor
        factLabel.layer.cornerRadius = 15
    }
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check segue ID
        if segue.identifier == "segue3"{
            //get the destination controller
            let webDestinationController = segue.destination as! WebViewController
            
            //push the data
            webDestinationController.detailsData = self.detailsData
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
