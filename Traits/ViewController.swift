
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    @IBOutlet var blueView: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if self.traitCollection.verticalSizeClass == .regular {
            blueView.bounds = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.bounds.width, height: 50)
            tableView.tableHeaderView = blueView
        } else {
            self.tableView.tableHeaderView = nil
        }
    }
    
}
