//
//  AppDelegate.swift
//  assignment3-vutran
//
//  Created by Default User on 1/28/24.
//

import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //age
    
    var window: UIWindow?
    var databaseName : String? = "a2v3.db"
    var databasePath : String?
    var users : [UserData] = []
    
    var avtPicked: String = ""
    var ageValue: Int = 0
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = documentPaths[0]
        databasePath = documentsDir.appending("/" + databaseName!)
        
        checkAndCreateDatabase()
        readDataFromDatabase()
        
        return true
    }
    
    func checkAndCreateDatabase() {
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath!)
        if(success) {return}
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
        
        return;
    }
    
    func readDataFromDatabase() {
        users.removeAll()
        var db: OpaquePointer? = nil
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            
            print("Successfully opened connection to database at \(self.databasePath)")
            var queryStatement: OpaquePointer? = nil
            let queryStatementString : String = "select * from a2v3"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                while( sqlite3_step(queryStatement) == SQLITE_ROW ) {
                    let _: Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cname = sqlite3_column_text(queryStatement, 1)
                    let cemail = sqlite3_column_text(queryStatement, 2)
                    let caddress = sqlite3_column_text(queryStatement, 3)
                    let cphone = sqlite3_column_text(queryStatement, 4)
                    
                    //let cage = Int(bitPattern: sqlite3_column_text(queryStatement, 5))
                    let cage = sqlite3_column_text(queryStatement, 5)
                    //print("read -> cage: \(sqlite3_column_text(queryStatement, 5))")
                    
                    let cgender = sqlite3_column_text(queryStatement, 6)
                    let cbirthday = sqlite3_column_text(queryStatement, 7)
                    let cavatar = sqlite3_column_text(queryStatement, 8)
                    
                    let name = String(cString: cname!)
                    let email = String(cString: cemail!)
                    let address = String(cString: caddress!)
                    let phone = String(cString: cphone!)
                    
                    //let age = Int(bitPattern: cage)
                    let age = String(cString: cage!)
                    
                    let gender = String(cString: cgender!)
                    let birthday = String(cString: cbirthday!)
                    let avatar = String(cString: cavatar!)
                    
                    let user: UserData = UserData.init(name: name, email: email, address: address, phone: phone, age: age, gender: gender, birthday: birthday, avatar: avatar)
                    users.append(user)
                }
                sqlite3_finalize(queryStatement)
            } else {
                print("SELECT statement could not be prepared")
            }
            
        } else {
            print("Unable to open database.")
        }
    }
    
    func insertIntoDatabase(user : UserData) -> Bool {
        var db: OpaquePointer? = nil
        var returnCode : Bool = true

        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(self.databasePath)")
            var insertStatement: OpaquePointer? = nil
            var insertStatementString : String = "insert into a2v3 values(NULL, ?, ?, ?, ?, ?, ?, ?, ?)"
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                let nameStr = user.name! as NSString
                let emailStr = user.email! as NSString
                let addressStr = user.address! as NSString
                let phoneStr = user.phone! as NSString
                
                //let ageStr = String(user.age!) as NSString
                let ageStr = user.age! as NSString
                
                let genderStr = user.gender! as NSString
                let birthdayStr = user.birthday! as NSString
                let avatarStr = user.avatar! as NSString
                
                sqlite3_bind_text(insertStatement, 1, nameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, emailStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, addressStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, phoneStr.utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 5, ageStr.utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 6, genderStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, birthdayStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, avatarStr.utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row. \(rowID)")
                } else {
                    print("Could not insert row.")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            } else {
                print("INSERT statement could not be prepared.")
                returnCode = false
            }
            sqlite3_close(db);
            
        } else {
            print("Unable to open database.")
            returnCode = false
        }
        return returnCode
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

