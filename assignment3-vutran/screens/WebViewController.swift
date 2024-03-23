//
//  WebViewController.swift
//  assignment3-vutran
//
//  Created by Default User on 1/28/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activity: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress = URL(string: "https://www.google.ca")
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self

        // Do any additional setup after loading the view.
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
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
