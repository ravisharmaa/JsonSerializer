//
//  DetailViewController.swift
//  JsonSerializer
//
//  Created by Ravi Bastola on 5/4/19.
//  Copyright © 2019 Ravi Bastola. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiUrl = "https://api.themoviedb.org/3/movie/popular?api_key=7ec3cb25106cd4edee5e12ae47b59094&language=en-US"
    
    var results = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: self.apiUrl) else { return  }
        
        getDataFromUrl(url)
    }
    
    fileprivate func getDataFromUrl(_ url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else { return }
            
            do {
                let movies = try JSONDecoder().decode(Movie.self, from: jsonData)
                self.results = movies.results
                
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            } catch let jsonError {
                print("some error with\(jsonError)")
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.results[indexPath.row].title
        
        return cell
    }
    
    
    
    
}
