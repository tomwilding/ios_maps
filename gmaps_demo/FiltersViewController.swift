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

class FiltersViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SWReveal for sliding menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
}
