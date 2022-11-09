//
//  SolarSystem.swift
//  Solar System App
//
//  Created by Eoghan on 11/02/2022.
//

import Foundation

class SolarSystem{
    //attributes
    var name          :   String
    var diameter      :   String
    var orbitalSpeed  :   String
    var fact          :   String
    var distFromSun   :   String
    var image         :   String
    var texture       :   String
    var website       :   String
    
    //init-s
    init () {
        self.name           = " "
        self.diameter       = " "
        self.orbitalSpeed   = " "
        self.fact           = " "
        self.distFromSun    = " "
        self.image          = " "
        self.texture        = " "
        self.website        = " "
    }
        
    init(name:String, diameter:String, orbitalSpeed:String, fact:String, distFromSun:String, image:String, texture:String, website:String){
        self.name           = name
        self.diameter       = diameter
        self.orbitalSpeed   = orbitalSpeed
        self.fact           = fact
        self.distFromSun    = distFromSun
        self.image          = image
        self.texture        = texture
        self.website        = website
        
    }
    //methods - if any
}

