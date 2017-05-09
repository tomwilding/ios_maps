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
        if let accessToken = AccessToken.current {
            print("user logged in")
            
            let connection = GraphRequestConnection()
            connection.add(GraphRequest(graphPath: "/me")) { httpResponse, result in
                switch result {
                case .success(let response):
                    print("Graph Request Succeeded: \(response)")
                    let username = response.dictionaryValue?["name"]
                    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                    label.center = CGPoint(x: 160, y: 285)
                    label.textAlignment = .center
                    label.text = "Welcome " + (username as! String)
                    self.view.addSubview(label)
                case .failed(let error):
                    print("Graph Request Failed: \(error)")
                }
            }
            connection.start()
            
        } else {
            print("user logged out")
            let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
            loginButton.center = view.center
            
            view.addSubview(loginButton)
        }
    }

}
