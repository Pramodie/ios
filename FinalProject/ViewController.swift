//
//  ViewController.swift
//  FinalProject
//
//  Created by pramodie athauda on 2/16/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backgroundImageViewe = UIImageView();
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view.
    }
    func setBackground(){
        view.addSubview(backgroundImageViewe)
        backgroundImageViewe.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageViewe.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageViewe.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageViewe.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageViewe.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //backgroundImageViewe.image = UIImage(named: <#T##String#>)
        view.sendSubviewToBack(backgroundImageViewe)
        
    }

}

