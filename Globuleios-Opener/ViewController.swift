//
//  ViewController.swift
//  Globuleios-Opener
//
//  Created by Antonin MOLIERES on 17/06/2019.
//  Copyright © 2019 kilab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let globuleScheme = "globule://"
    private let globuleItunesUrl = "https://apps.apple.com/fr/app/globule/id432735249"
    
    @IBAction func openGlobule(_ sender: Any) {
        
        var alert: UIAlertController?
        
        #if targetEnvironment(simulator)
    
        alert = UIAlertController(title: "Erreur", message: "Cette application doit être lancé depuis un veritable appareil", preferredStyle: .alert)
        alert?.addAction(UIAlertAction(title: "Ok", style: .default))
        
        #else
        
        if let globuleUrl = URL(string: globuleScheme), UIApplication.shared.canOpenURL(globuleUrl) {
            // We can open Globule scheme
            UIApplication.shared.open(globuleUrl, options: [:])
            
            
        } else if let globuleAppStoreUrl = URL(string: globuleItunesUrl), UIApplication.shared.canOpenURL(globuleAppStoreUrl) {
            
            // We can't open Globule scheme -> Redirect user to AppStore
            alert = UIAlertController(title: "Erreur", message: "Globule n'est pas installé", preferredStyle: .alert)
            alert?.addAction(UIAlertAction(title: "Annuler", style: .cancel))
            alert?.addAction(UIAlertAction(title: "AppStore", style: .default, handler: { _ in
                UIApplication.shared.open(globuleAppStoreUrl, options: [:], completionHandler: nil)
            }))
            
            
        } else {
            // AppStore link missing, show an error
            alert = UIAlertController(title: "Erreur", message: "Impossible d'ouvrir Globule", preferredStyle: .alert)
            alert?.addAction(UIAlertAction(title: "Ok", style: .default))
            
        }
        #endif
        
        if let alert = alert {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

