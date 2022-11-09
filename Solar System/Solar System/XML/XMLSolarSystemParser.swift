//
//  XMLSolarSystemParser.swift
//  Solar System
//
//  Created by Eoghan on 25/02/2022.
//

import Foundation

class XMLSolarSystemParser : NSObject, XMLParserDelegate{
    var fileName: String
    init(fileName:String){self.fileName = fileName}
    
    //vars to hold tag data
    var pName, pDiameter, pOrbitalSpeed, pFact, pDistFromSun, pImage, pTexture, pWebsite : String!
    
    //vars to spy during parsing
    var elementID = -1
    var passData = false
    
    //vars to manage whole data
    var solarSystemBody = SolarSystem()
    var solarSystem = [SolarSystem]()
    
    var parser = XMLParser()
    
    var tags = ["name", "diameter", "orbitalspeed", "fact",  "distfromsun", "image", "texture", "website"]
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // if elementName is in tags then spy
        if (tags.contains(elementName)){
            passData = true
            switch (elementName){
                case "name"         : elementID = 0
                case "diameter"     : elementID = 1
                case "orbitalspeed" : elementID = 2
                case "fact"         : elementID = 3
                case "distfromsun"  : elementID = 4
                case "image"        : elementID = 5
                case "texture"      : elementID = 6
                case "website"      : elementID = 7
                default             : break
            }
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //based on the spies grab some data into pVars
        if passData{
            switch elementID{
                case 0 : pName          = string
                case 1 : pDiameter      = string
                case 2 : pOrbitalSpeed  = string
                case 3 : pFact          = string
                case 4 : pDistFromSun   = string
                case 5 : pImage         = string
                case 6 : pTexture       = string
                case 7 : pWebsite      = string
                default : break
            }
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //reset the spys
        if tags.contains(elementName){
            passData    = false
            elementID   = -1
        }
        if elementName == "SolarSystemElement"{
            solarSystemBody = SolarSystem(name: pName, diameter: pDiameter, orbitalSpeed: pOrbitalSpeed, fact: pFact, distFromSun: pDistFromSun, image: pImage, texture: pTexture, website: pWebsite)
        
            solarSystem.append(solarSystemBody)
        }
    }
    func parsing(){
        let bundleUrl = Bundle.main.bundleURL
        let fileUrl = URL(string: self.fileName, relativeTo: bundleUrl)
        // make the parser for this file
        parser = XMLParser(contentsOf: fileUrl!)!
        // give the delegate and parse
        parser.delegate = self
        parser.parse()
    }
}
