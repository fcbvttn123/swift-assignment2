//
//  TableViewCell.swift
//  assignment3-vutran
//
//  Created by Default User on 3/22/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let name = UILabel()
    let email = UILabel()
    let address = UILabel()
    let phone = UILabel()
    let age = UILabel()
    let gender = UILabel()
    let birthday = UILabel()
    let img = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        name.textAlignment = NSTextAlignment.left
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.backgroundColor = UIColor.clear
        name.textColor = UIColor.black
        
        email.textAlignment = NSTextAlignment.left
        email.font = UIFont.boldSystemFont(ofSize: 18)
        email.backgroundColor = UIColor.clear
        email.textColor = UIColor.black
        
        address.textAlignment = NSTextAlignment.left
        address.font = UIFont.boldSystemFont(ofSize: 18)
        address.backgroundColor = UIColor.clear
        address.textColor = UIColor.black
        
        phone.textAlignment = NSTextAlignment.left
        phone.font = UIFont.boldSystemFont(ofSize: 18)
        phone.backgroundColor = UIColor.clear
        phone.textColor = UIColor.black
        
        age.textAlignment = .left
        age.font = UIFont.boldSystemFont(ofSize: 18)
        age.backgroundColor = UIColor.clear
        age.textColor = UIColor.black
        
        gender.textAlignment = NSTextAlignment.left
        gender.font = UIFont.boldSystemFont(ofSize: 18)
        gender.backgroundColor = UIColor.clear
        gender.textColor = UIColor.black
        
        birthday.textAlignment = .left
        birthday.font = UIFont.boldSystemFont(ofSize: 18)
        birthday.backgroundColor = UIColor.clear
        birthday.textColor = UIColor.black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(name)
        contentView.addSubview(email)
        contentView.addSubview(address)
        contentView.addSubview(phone)
        contentView.addSubview(age)
        contentView.addSubview(gender)
        contentView.addSubview(birthday)
        contentView.addSubview(img)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var f = CGRect(x: 100, y: 10, width: 460, height: 30)
        name.frame = f
        
        f = CGRect(x: 100, y: 40, width: 460, height: 30)
        email.frame = f
        
        f = CGRect(x: 100, y: 70, width: 460, height: 30)
        address.frame = f
        
        f = CGRect(x: 100, y: 100, width: 460, height: 30)
        phone.frame = f
        
        f = CGRect(x: 100, y: 130, width: 460, height: 30)
        age.frame = f
        
        f = CGRect(x: 100, y: 160, width: 460, height: 30)
        gender.frame = f
        
        f = CGRect(x: 100, y: 190, width: 460, height: 30)
        birthday.frame = f
        
        f = CGRect(x: 2, y: 2, width: 30, height: 30)
        img.frame = f
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
