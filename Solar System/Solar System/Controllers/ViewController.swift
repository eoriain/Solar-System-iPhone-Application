//
//  ViewController.swift
//  Solar System App
//
//  Created by Eoghan on 11/02/2022.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    //model data
    var detailsData : SolarSystem!
    let solarSystemElementData = SolarSystemElement(xmlFileName: "ourSolarSystem.xml")
    
    func populateView(){
        let scene = SCNScene()
        modelSceneView.scene = scene
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:0, y:0, z:5)
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x:0, y:1, z:4)
        scene.rootNode.addChildNode(lightNode)
       
        detailsData = solarSystemElementData.getSolarSystem(index: index)
        let planetNode = PlanetNode()
        planetNode.setTexture(texture: detailsData.texture)
        scene.rootNode.addChildNode(planetNode)
     
        modelSceneView.allowsCameraControl = true
       
        nameLabel.text = detailsData.name
        
        scene.background.contents = UIImage(named: "stars.jpeg")
    }
    // Outlets
    //@IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelSceneView: SCNView!

    //Actions
    var index : Int!;
    @IBAction func previousButton(_ sender: UIButton) {
        index = index - 1
        if index == -1 {
            index = solarSystemElementData.getCount() - 1
        }
        detailsData = solarSystemElementData.getSolarSystem(index: index)
        populateView()
    }
    @IBAction func nextButton(_ sender: UIButton) {
        index = index + 1
        if index == solarSystemElementData.getCount(){
            index = 0
        }
        detailsData = solarSystemElementData.getSolarSystem(index: index)
        populateView()
    }
    @IBAction func moreInfoAction(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsData = solarSystemElementData.getSolarSystem(index: index)
        populateView()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
        // Do any additional setup after loading the view.
        
        // data is pushed over the segue
        
        // populate the outlets
        //detailsData = solarSystemElementData.getSolarSystem(index: index)
        //populateView()
        
        
    //}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check segue ID
        if segue.identifier == "segue1"{
            //get the destination controller
            let destinationController = segue.destination as! DetailsViewController
            
            //push the data
            destinationController.detailsData = self.detailsData
        }
    }
}
