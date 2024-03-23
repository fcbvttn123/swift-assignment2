//
//  ViewController.swift
//  assignment3-vutran
//
//  Created by Default User on 1/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func unwindToThisView(sender : UIStoryboardSegue) {
        // typically empty unless special code needed
    }
    
    @IBAction func printUsers(sender: Any) {
        mainDelegate.readDataFromDatabase()
        for u in mainDelegate.users {
            u.printUserData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainDelegate.readDataFromDatabase()
    }


}

