//
//  WebViewController.swift
//  Solar System
//
//  Created by Eoghan on 10/03/2022.
//

import UIKit
import WebKit

class WebViewController: UIWebView{
    var detailsData : SolarSystem!
    
    @IBOutlet weak var webWindow: UIWebView!
    @IBOutlet weak var urlTextField: UIToolbar!
    
    @IBAction func searchButton(_ sender: Any) {
        let url = URL(string:self.urlTextField.text)
        let req = URLRequest(requestWithURL:url)
        self.urlTextField.resignFirstResponder();
        self.webWindow.loadRequest(req);
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
