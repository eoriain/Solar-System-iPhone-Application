//
//  SolarSystemElement.swift
//  Solar System Table
//
//  Created by Eoghan on 18/02/2022.
//

import Foundation

class SolarSystemElement{
    //class data
    var solarSystemElementData : [SolarSystem]
    

    
    init(xmlFileName: String){
        //make a XMLSolarSystemParser
        let parser = XMLSolarSystemParser(fileName: xmlFileName)
        // parsing
        parser.parsing()
        //set solarSystemElementData with  what it comes from parsing
        solarSystemElementData =  parser.solarSystem
        
    }
    
    //class methods
    func getCount()->Int{return solarSystemElementData.count}
    func getSolarSystem(index:Int)->SolarSystem{return solarSystemElementData[index]}
    
}

