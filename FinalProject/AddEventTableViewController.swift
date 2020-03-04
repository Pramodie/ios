//
//  AddEventTableViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/29/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Firebase


struct Events {

    var eventname : String

    var description: String

    var imageur : String

}


class AddEventTableViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    //@IBOutlet var tblEvents: UITableView!
    private var events = [Events]()
//    private var items = [JSON](){
//        didSet{
//            tblEvents.reloadData()
//        }
//    }
   // @IBOutlet weak var tblEvents: UITableView!
    
    @IBOutlet weak var tblEvents: UITableView!
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.fetchEvents()
      self.nothingToShow()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblEvents.dequeueReusableCell(withIdentifier: "event", for: indexPath) as! EventTBCellTableViewCell
        cell.txteventname.text = events[indexPath.row].eventname
        
        cell.txtdes.text = events[indexPath.row].description
        
        
        let imageut = URL(string: events[indexPath.row].imageur)
        
        cell.eventimage.kf.setImage(with: imageut)
        
        return cell
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 260
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tblEvents.dequeueReusableCell(withIdentifier: "EventTBCellTableViewCell", for: indexPath) as! EventTBCellTableViewCell
//
//
//
//
//return cell
//        return cell
//    }
//
    
    
    func fetchEvents() {
        
        let db = Firestore.firestore()
        db.collection("Events").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    
                    let Title = document.data()["EventName"] as? String
                    
                    let description = document.data()["Text"] as? String
                    
                    let imageurl =  document.data()["ImageUrl"] as? String
                    
                    // let imageurl = document.data()["image"] as? String
                    
                    let event = Events(eventname: Title!, description: description!, imageur: imageurl!)
                    
                    self.events.append(event)
                    
                  
                 
                }
                  self.tblEvents.reloadData()
                
                
            }
           
        }
   
    }
   


    
   /* @IBAction func loginOutBtn(_ sender: Any) {
        
         let firebaseAuth = Auth.auth()
        do {
        try firebaseAuth.signOut()
         let sb = self.storyboard?.instantiateViewController(withIdentifier: "logVC") as! LoginViewController
        self.present(sb, animated: true, completion: nil)
        } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
         }
        
        
    }*/
    //  @IBAction func loutoutbtn(_ sender: Any) {
        
       // let firebaseAuth = Auth.auth()
        //do {
            //try firebaseAuth.signOut()
           // let sb = self.storyboard?.instantiateViewController(withIdentifier: "logVC") as! LoginViewController
            //self.present(sb, animated: true, completion: nil)
        //} catch let signOutError as NSError {
           // print ("Error signing out: %@", signOutError)
       // }
    //}
    
    func showAlert(message:String)
    {
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
       // self.present(alert, animated: true)
    }
    
    func nothingToShow(){
        let lable = UILabel(frame: .zero)
        lable.textColor = UIColor.darkGray
        //lable.numberOfLines = 0
           lable.numberOfLines = 0
        lable.text = " No articles to show"
        lable.textAlignment = .center
        tblEvents.separatorStyle = .none
        tblEvents.backgroundView = lable
    }
    
    
    
}
