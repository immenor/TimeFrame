import UIKit

class ViewController: UIViewController {
    let label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

