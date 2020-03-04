//
//  LoginViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/26/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //ffffff
    }
    
    @IBAction func btnLogihn(_ sender: Any) {
         Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (AuthDataResult
            , Error
        ) in
        
            if Error != nil {
                //let alert: UIAlertView = UIAlertView(title: "Logged in success ", message: "Thanks for using us", delegate: nil, cancelButtonTitle: "Cancel")
                
                //alert.show()
                let alert: UIAlertView = UIAlertView(title: "Something went wrong", message: Error?.localizedDescription, delegate: nil, cancelButtonTitle: "Cancel")
                
                alert.show()
               
               
                
                
            }else {
                //let appDelegate = UIApplication.shared.delegate as! AppDelegate
               // let mainStoryboard: UIStoryboard = UIStoryboard(name: "DashBoard", bundle: nil)
                //let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNav")as! UITabBarController
                //appDelegate.window?.rootViewController = yourVC
               // appDelegate.window?.makeKeyAndVisible()
                
                
                 self.performSegue(withIdentifier: "MainNav", sender: nil)
            }
        }
    }
    

    @IBAction func btnForgotPassword(_ sender: Any) {
    }
    @IBAction func btnRegister(_ sender: Any) {
    }
}
