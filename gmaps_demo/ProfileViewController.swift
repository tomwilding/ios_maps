//
//  ProfileViewController.swift
//  gmaps_demo
//
//  Created by Tom Wilding on 15/04/2017.
//  Copyright © 2017 Tom Wilding. All rights reserved.
//
import UIKit
import FacebookCore
import FacebookLogin

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
            
        view.addSubview(loginButton)
    }
    
}
