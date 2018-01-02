import Foundation
import UIKit

class AddAvailabilityViewController: UIViewController {
    let router: Router

    init(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        setupViews()
        setupNavigationBar()
    }

    private func setupViews() {
        view.backgroundColor = UIColor.black
    }

    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancel)
        )

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .done,
            target: self,
            action: #selector(add)
        )
    }

    @objc private func cancel() {
        if let navCtrl = navigationController {
            router.dismissModal(from: navCtrl)
        }
    }

    @objc private func add() {

    }
}
