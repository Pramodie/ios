//
//  AddProfileViewController.swift
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

class AddProfileViewController: UIViewController {

    
    @IBOutlet var txtFirstName: UITextField!
    
    @IBOutlet var txtSecondName: UITextField!
    
    @IBOutlet var txtMobile: UITextField!
    
    @IBOutlet var txtFbUrl: UITextField!
    
    @IBOutlet var profileImage: UIImageView!
    
     var selectedUImage: UIImage?
     //var pickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//add data
     
        // Do any additional setup after loading the view.
        let tapGesture =   UITapGestureRecognizer(target: self, action:#selector(AddProfileViewController.handleSelectProfilePhoto))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
    }


     @IBAction func handleSelectProfilePhoto(){
        let pickerController = UIImagePickerController()
       // imagePicker = UIImagePickerController()
        //pickerController.allowsEditing = true
       // pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        
        //pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
 
    

    @IBAction func btnAddProfile(_ sender: Any) {
       //let fname =  txtFirstName.text
        //let sname =  txtSecondName.text
        //let fb = txtFbUrl.text
       // let m = txtMobile.text
        //image
        guard  let uid=Auth.auth().currentUser?.uid  else {return}
         let dictioner  = ["FirstName": txtFirstName.text ?? "" ,"SecondName" : txtSecondName.text ?? "" , "FbUrl": txtFbUrl.text ?? "" , "Mobile" : txtMobile.text ?? "" ]
        
        
        Database.database().reference().child("Profile").child(String(uid)).setValue(dictioner)
        {
            (error:Error? ,ref: DatabaseReference) in
            if error != nil{
                print("Save success")
            }
            else{
               // print(error)
                print(error)
            }
        }

        
       
       let db = Firestore.firestore()
        db.collection("Profiles").addDocument(data: dictioner)
        //db.collection("Profiles").setValue(dictioner)
        //nrew code 
        
   /*     let db = Firestore.firestore()
        let stroageRef = Storage.storage().reference(forURL: "gs://ios-cw-ea659.appspot.com").child("Profiles").child(result!.user.uid)
        
       // let str = Storage.storage().reference(forURL: "gs://ios-cw-ea659.appspot.com").child(result!.user.uid)
        if let profileImage = self.selectedUImage, let imageData = profileImage.jpegData(compressionQuality: 0.1)
        {
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            
            stroageRef.putData(imageData, metadata: metaData, completion: { (metadata, error ) in
                if error != nil{
                    self.showError("Error in uploading profile photo.")
                }
                
                stroageRef.downloadURL(completion: { (url, error) in
                    if let metaImageUrl = url?.absoluteString{
                       
                        print(metaImageUrl)
                        
                        db.collection("user").document(result!.user.uid).setData(
                            
                            ["FirstName" : firstname,
                             "SecondName" : secondname,
                             "FbUrl": fburl,
                             "Mobile" : mobile,
                             "ProfilePhoto" : metaImageUrl,
                             "uid" : result!.user.uid])
                        { (error) in
                            
                            if error != nil {
                                self.showError("error saving user data")
                            }
                        }
                        self.movetohome()
                        
                        
                        
                        
                    }
                })
                
            })
            
        }*/
        
        
        
        
    
        //end of nrew
     
        
        
     
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
extension AddProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("did finish picking media")
        
         if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.profileImage.image = image
            selectedUImage = image
        }
        
        //let image = info
        print(info)
        //profileImage.image = infoPhoto
        dismiss(animated: true, completion: nil)
        
    }
    /*extension PublisherPrflViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                publishImage.image = image
            }
            
            dismiss(animated: true, completion: nil)
        }
    }*/
    
    //func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String: Any]) {
    
       // if let pickImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            //self.profileImage.image = pickImage
        //}
        //picker.dismiss(animated: true, completion: nil)
        
        //}

    
}
