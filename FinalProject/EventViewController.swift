//
//  EventViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/29/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit
import Firebase
import  FirebaseAuth
import  FirebaseDatabase
import  FirebaseStorage

class EventViewController: UIViewController {
    
    @IBOutlet var eventImage: UIImageView!
    
    //@IBOutlet var txteventName: UITextField!
    
   // @IBOutlet var txteventText: UITextField!
    //@IBOutlet var txteventName: UITextField!
    
    //@IBOutlet var txteventText: UITextField!
    
    @IBOutlet weak var txteventName: UITextField!
    
    @IBOutlet weak var txteventText: UITextField!
    
    
    var selectedUImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

         let tapGesture =   UITapGestureRecognizer(target: self, action:#selector(EventViewController.handleSelectProfilePhoto))
        eventImage.addGestureRecognizer(tapGesture)
        eventImage.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    //
    
    @IBAction func handleSelectProfilePhoto(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func btnCreateEvent(_ sender: Any) {
        
        let eventName = txteventText.text ?? ""
        let text = txteventText.text ?? ""
        
        let db = Firestore.firestore()
        db.collection("Events").addDocument(data: ["EventName ": eventName, "Text": text])
        
        
        
       // guard  let uid=Auth.auth().currentUser?.uid  else {return}
        //let dt = ["EventName": txteventName.text ?? "", "Text":txteventText.text ?? ""]
        //let dictioner  = ["EventName": txteventName.text ?? "" ,"Text" : txteventText.text ?? ""]
        
        
        
        
       // Database.database().reference().child("Event").child(String(uid)).setValue(dt)
        //Database.database().reference().child("Event").child(String(uid)).setValue(dictioner)
        //{
          /*  (error:Error? ,ref: DatabaseReference) in
            if error != nil{
                print("save Success")
            }
            else{
                print(error)
            }
        }
        
        
        
        let db = Firestore.firestore()
        db.collection("Events").addDocument(data: dt)*/
        //let 
        
        
        
        
        
       // let dictioner  = ["EventName": txteventName.text! as String,"Text" : txteventText.text! as String ]
       // let db = Firestore.firestore()
       // db.collection("Events").addDocument(data: dictioner)
    }


}
extension EventViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did finish picking media")
        
        if let image = info ["UIImagePickerControllerOriginalImage"] as? UIImage{
            eventImage.image = image
            //selectedUImage = image
             selectedUImage = image
            print(info)
        }
        
      
       
        dismiss(animated: true, completion: nil)
    }
}
