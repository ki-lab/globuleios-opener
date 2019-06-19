//
//  ViewController.swift
//  Globuleios-Opener
//
//  Created by Antonin MOLIERES on 17/06/2019.
//  Copyright © 2019 kilab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let globuleSheme = "globule://"
    private let globuleItunesUrl = "https://apps.apple.com/fr/app/globule/id432735249"
    
    @IBAction func openGlobule(_ sender: Any) {
        
        if let globuleUrl = URL(string: globuleSheme), UIApplication.shared.canOpenURL(globuleUrl) {
            // We can open Globule scheme
            UIApplication.shared.open(globuleUrl, options: [:])
            
            
        } else if let globuleAppStoreUrl = URL(string: globuleItunesUrl), UIApplication.shared.canOpenURL(globuleAppStoreUrl) {
            
            // We can't open Globule scheme -> Redirect user to AppStore
            let alert = UIAlertController(title: "Erreur", message: "Globule n'est pas installé", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Annuler", style: .cancel))
            alert.addAction(UIAlertAction(title: "AppStore", style: .default, handler: { _ in
                UIApplication.shared.open(globuleAppStoreUrl, options: [:], completionHandler: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            // AppStore link missing, show an error
            let alert = UIAlertController(title: "Erreur", message: "Impossible d'ouvrir Globule", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }

    }
    
}

