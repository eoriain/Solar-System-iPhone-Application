//
//  PlanetModelNode.swift
//  3DPlanet
//
//  Created by Eoghan on 06/03/2022.
//

import SceneKit

class PlanetNode: SCNNode {

    var texture : String! = "earthmap1k.jpg"
    
    override init(){
        super.init()

        self.geometry = SCNSphere(radius: 1)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: texture)
        
        let action = SCNAction.rotate(by: 360*CGFloat(Double.pi/180), around: SCNVector3(x:0, y:1, z:0), duration: 20)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func setTexture(texture:String){
        self.texture = texture
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: texture)
    }

}
