//
//  LoginViewController.swift
//  gmaps_demo
//
//  Created by Tom Wilding on 01/04/2017.
//  Copyright © 2017 Tom Wilding. All rights reserved.
//
import UIKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Add Facebook Login button
            let loginButton = LoginButton(readPermissions: [ .publicProfile ])
            loginButton.center = view.center
            
            view.addSubview(loginButton)
    }
    
}

