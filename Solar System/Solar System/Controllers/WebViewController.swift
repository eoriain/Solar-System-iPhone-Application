//
//  WebViewController.swift
//  Solar System
//
//  Created by Eoghan on 10/03/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    var detailsData : SolarSystem!
    

    @IBOutlet weak var webWindow: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = NSURL(string: detailsData.website)
        let urlRequest = NSURLRequest(url: url! as URL)
        self.webWindow.loadRequest(urlRequest as URLRequest)

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
