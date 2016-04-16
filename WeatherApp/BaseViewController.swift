//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Suresh on 4/16/16.
//  Copyright © 2016 Suresh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Initiate the Network Monitoring...
        AFNetworkReachabilityManager.sharedManager().startMonitoring();
    }

    override func viewDidAppear(animated: Bool) {
         super.viewDidAppear(animated)
        //Add reachability observer for the current class...
        self.addreachabilityObserver()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Remove reachability obser for the current class...
        self.removeReachabilityObserver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Reachability observer - notifier
    //Add Reachability Observer
    func addreachabilityObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("networkChanged:"), name: AFNetworkingReachabilityDidChangeNotification, object: nil);
    }
    
    //Remove Rechability Observer
    func removeReachabilityObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: AFNetworkingReachabilityDidChangeNotification, object: nil);
    }
    
    func networkChanged(sender : AnyObject) {
        let isConnected = AFNetworkReachabilityManager.sharedManager().reachable
        if(!isConnected) {
            let alertView = UIAlertView(title: "Network Unavailable!", message: "You're seems to be offline, please connect to a network", delegate: self, cancelButtonTitle: "Ok")
            alertView.show()
            
        }
    }

}
