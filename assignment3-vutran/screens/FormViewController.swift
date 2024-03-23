//
//  FormViewController.swift
//  assignment3-vutran
//
//  Created by Default User on 1/28/24.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var age: UISlider!
    @IBOutlet var gender: UISwitch!
    @IBOutlet var birthday: UIDatePicker!
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    @IBAction func formSubmission() {
        
        let userData = UserData(
            name: name.text,
            email: email.text,
            address: address.text,
            phone: phone.text,
            age: String(Int(mainDelegate.ageValue)),
            gender: gender.isOn ? "Male" : "Female",
            birthday: birthday.date.description,
            avatar: mainDelegate.avtPicked
        )
        
        let success = mainDelegate.insertIntoDatabase(user: userData)
        
        if let nameText = name.text, let emailText = email.text {
            let alert = UIAlertController(
                title: "Thank You",
                message: "Thank you \(nameText) of \(emailText) for your time",
                preferredStyle: .actionSheet
            )
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true)
        } else {
            
        }
    }
    
    @IBAction func pickAvt1(sender: Any) {
        mainDelegate.avtPicked = "avt1"
        if let button = sender as? UIButton {
            button.backgroundColor = UIColor.blue
            btn2.backgroundColor = UIColor.white
            btn3.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func pickAvt2(sender: Any) {
        mainDelegate.avtPicked = "avatar1.jpg"
        if let button = sender as? UIButton {
            button.backgroundColor = UIColor.blue
            btn1.backgroundColor = UIColor.white
            btn3.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func pickAvt3(sender: Any) {
        mainDelegate.avtPicked = "avatar3.jpg"
        if let button = sender as? UIButton {
            button.backgroundColor = UIColor.blue
            btn2.backgroundColor = UIColor.white
            btn1.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func ageSliderChanged(sender: Any) {
        mainDelegate.ageValue = Int(age.value)
        print(String(Int(mainDelegate.ageValue)))
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
