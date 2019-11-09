//
//  ViewController.swift
//  MusicFav
//
//  Created by Jose David Bustos H on 11/8/19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit

class ViewControllerMusic: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private let musicModels = MusicModel()
    var ArtisArray = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArtisArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
     
        cell.LabelArtistName.text = "artist test" //ArtisArray[indexPath.row]
        cell.LabelCollectionName.text = "Test name"
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

