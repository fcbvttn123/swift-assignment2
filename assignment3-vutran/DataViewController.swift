//
//  DataViewController.swift
//  assignment3-vutran
//
//  Created by Default User on 3/22/24.
//

import UIKit

class DataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainDelegate.readDataFromDatabase()
        return mainDelegate.users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        mainDelegate.readDataFromDatabase()
        
        let tableCell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell ?? TableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let rowNum = indexPath.row
        
        tableCell.name.text = mainDelegate.users[rowNum].name
        tableCell.email.text = mainDelegate.users[rowNum].email
        tableCell.age.text = mainDelegate.users[rowNum].age
        tableCell.address.text = mainDelegate.users[rowNum].address
        tableCell.phone.text = mainDelegate.users[rowNum].phone
        tableCell.birthday.text = mainDelegate.users[rowNum].birthday
        tableCell.gender.text = mainDelegate.users[rowNum].gender
        
        let imgName: String
        if(mainDelegate.users[rowNum].avatar == "avt1") {
            imgName = "img1.jpg"
        } else if (mainDelegate.users[rowNum].avatar == "avatar1.jpg") {
            imgName = "img2.jpg"
        } else {
            imgName = "img3.jpg"
        }
        tableCell.img.image = UIImage(named: imgName)
        
        let backgroundImage = UIImage(named: "bg-img.jpeg")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        tableCell.backgroundView = backgroundImageView
        
        tableCell.accessoryType = .disclosureIndicator
        return tableCell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
