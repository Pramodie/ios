//
//  RegisterNetworkClient.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/26/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import Foundation



class RegisternetworkClient{
    
    static func regiterUser(email:String,password:String,completion:@escaping(Bool)->())  {
        Fba.shared.createUser(withEmail: email, password: password) { (AuthDataResult
            , Error
            ) in
            if Error == nil {
                
                DispatchQueue.main.async {
                    completion(true)
                }
                
            } else {
                
                DispatchQueue.main.async {
                    completion(false)
                }

            }
            
        }
    }

    //static func Addprofile(fname:String, sname:String, fb: String, m:String){
        
    //}
}
