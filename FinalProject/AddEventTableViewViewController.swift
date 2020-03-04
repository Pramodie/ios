//
//  AddEventTableViewViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 3/1/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import  FirebaseStorage
import FirebaseDatabase

class AddEventTableViewViewController: UIViewController {
    
    
   // @IBOutlet var tableView: UITableView!
    //var ref = DatabaseReference.init()
   // var arryData = [AddEventTableView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.ref = Database.database().reference()
        //getData()
        // Do any additional setup after loading the view.
    }
    
    
   /* func getData(){
    
        
        
      //  Database.database().reference().child("Events").observe(.childAdded){  (snapshot: DataSnapshot) in
        //print(snapshot.value)
            
            
       //}
self.ref.child("Events").queryOrderedByKey().observe(.childAdded){(snapshot: DataSnapshot) in
    
    self.arryData.removeAll()
    
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapShot{
                    //print("wwwwwwwwwwwww\(snap)")
                    print (snap)
                    if let mainDict = snap.value as? [String: AnyObject]{
                        let eventname = mainDict["eventname"] as? String ?? ""
                        let text = mainDict["text"] as? String ?? ""
                        let profileimage = mainDict["profileimageurl"] as? String ?? ""
                        self.arryData.append(AddEventTableView(eventname: eventname,text: text, profileimageurl: profileimage))
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }


}*/
/*extension AddEventTableViewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arryData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTBCellTableViewCell", for: indexPath) as! EventTBCellTableViewCell
       cell.addevent = arryData[indexPath.row]

        return cell
    }*/



    
}

