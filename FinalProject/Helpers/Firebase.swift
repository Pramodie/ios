//
//  Firebase.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/26/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase
class Fbs {
    
    static let shared =  Firestore.firestore()
    
    
}
class Fba{
    
    static let shared = Auth.auth()
}


