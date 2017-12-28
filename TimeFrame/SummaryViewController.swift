import UIKit

class SummaryViewController: UIViewController {
    let label: UILabel = UILabel()
    let router: Router!

    init(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(createPerson))

        label.text = "hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func createPerson() {
        router.showCreatePersonModal()
    }
}
