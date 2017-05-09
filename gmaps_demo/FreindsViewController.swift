//
//  FriendsViewController.swift
//  gmaps_demo
//
//  Created by Tom Wilding on 15/04/2017.
//  Copyright © 2017 Tom Wilding. All rights reserved.
//
import UIKit
import FacebookCore
import FacebookLogin

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SWReveal for sliding menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        if let accessToken = AccessToken.current {
            print("user logged in with token")
            print(accessToken.authenticationToken)

            // Show facebook friends
            let connection = GraphRequestConnection()
            connection.add(GraphRequest(graphPath: "/me/friends")) { httpResponse, result in
                switch result {
                case .success(let response):
                    print("Graph Request Succeeded: \(response)")
                    // Friends that have authorised the app
                case .failed(let error):
                    print("Graph Request Failed: \(error)")
                }
            }
            connection.start()
        }
    }
    
}
