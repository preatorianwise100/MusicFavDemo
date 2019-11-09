//
//  ViewController.swift
//  MusicFav
//
//  Created by Jose David Bustos H on 11/8/19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit

class ViewControllerMusic: UIViewController {
    
    private let musicModels = MusicModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadDataFromApi()
        
    }
    func loadDataFromApi(){
        self.musicModels.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object: \(contexts)")
            DispatchQueue.main.sync {
                if let gtitle = contexts.artistName {
                    print("gtitle :"+gtitle)
                }
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

