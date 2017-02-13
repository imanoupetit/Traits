//
//  ViewController1.swift
//  Traits
//
//  Created by Imanou Petit on 13/02/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//


import UIKit

class ViewController1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    let imageView = UIImageView(image: UIImage(named: "Les Ménuires"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.bounds = CGRect(origin: imageView.bounds.origin, size: CGSize(width: imageView.bounds.width, height: 100))
        tableView.tableHeaderView = imageView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Bob"
        return cell
    }
    
}
