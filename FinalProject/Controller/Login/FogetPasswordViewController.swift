//
//  FogetPasswordViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/26/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit
import  FirebaseAuth

class FogetPasswordViewController: UIViewController {

   // @IBOutlet var txtEmail: UIView!
    
   // @IBOutlet var txtNewPassword: UIView!
    
   // @IBOutlet var txtConfirmPassword: UIView!
    
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func btnNewPass(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: txtpassword.text!) { error in
            DispatchQueue.main.async {
                
                if error != nil {
                    
                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                    // YOUR ERROR CODE
                } else {
                    
                    let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                    resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    //self.present(resetEmailAlertSent, animated: true, completion: nil)
                      self.present(resetEmailAlertSent, animated: true, completion: nil)
                    //YOUR SUCCESS MESSAGE
                }
            }
        }
    }
    //end
    /*
     @IBOutlet var btnSignIn: UIView!
     @IBOutlet var btnSignUp: UIView!
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //@IBOutlet var btnSingIn: UIView!
    
   // @IBAction func btnNewPassword(_ sender: Any) {
       // Fba.shared.currentUser(withEmail: txtEmail.text!, password: txtNewPassword.text!)
        
       // )
    
    //}
    
   // @IBAction func btnSignIn(_ sender: Any) {
    //}
    
}
