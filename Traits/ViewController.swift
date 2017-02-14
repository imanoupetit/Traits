
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    @IBOutlet weak var blueView: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if previousTraitCollection?.verticalSizeClass != traitCollection.verticalSizeClass {
            switch traitCollection.verticalSizeClass {
            case .compact:
                blueView.constraints.forEach({ $0.isActive = false })
                blueView.translatesAutoresizingMaskIntoConstraints = false
                self.tableView.tableHeaderView = nil
            case .unspecified:
                fallthrough
            case .regular:
                blueView.constraints.forEach({ $0.isActive = false })
                blueView.translatesAutoresizingMaskIntoConstraints = true
                blueView.bounds = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.bounds.width, height: 50)
                tableView.tableHeaderView = blueView
            }
        }
    }

    /*
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if self.traitCollection.verticalSizeClass == .regular {
            blueView.constraints.forEach({ $0.isActive = false })
            blueView.translatesAutoresizingMaskIntoConstraints = true
            blueView.bounds = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.bounds.width, height: 50)
            tableView.tableHeaderView = blueView
        } else {
            blueView.constraints.forEach({ $0.isActive = false })
            blueView.translatesAutoresizingMaskIntoConstraints = false
            self.tableView.tableHeaderView = nil
        }
    }
    */
    
}
