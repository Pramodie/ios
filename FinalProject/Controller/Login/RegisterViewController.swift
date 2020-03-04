//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/26/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegiter(_ sender: Any) {
        RegisternetworkClient.regiterUser(email:txtEmail.text!,password: txtPassword.text!){
            success in
            if(success){
                
              
                self.performSegue(withIdentifier: "MainNav", sender: nil)
                
               
            }else{
                print("Something went wrong")
            }
        }

    }
    
    @IBAction func btnLogin(_ sender: Any) {
    }
    
}
