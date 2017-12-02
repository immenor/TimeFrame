import Foundation
import UIKit

protocol Router {
    var rootNavigationController: UINavigationController {get set}
    func setupRootViewController()
    func showCreatePersonModal()
    func dismissModal()
}

class NavigationRouter: NSObject, Router {
    var rootNavigationController: UINavigationController
    var rootViewController: SummaryViewController?

    init(navigationController: UINavigationController) {
        rootNavigationController = navigationController
    }

    func setupRootViewController() {
        rootViewController = SummaryViewController(router: self)
        rootNavigationController.pushViewController(
            rootViewController!,
            animated: false
        )
    }

    func showCreatePersonModal() {
        let modal = CreatePersonViewController(router : self)
        let navCtrl = UINavigationController(rootViewController: modal)

        rootNavigationController.present(
            navCtrl,
            animated: true,
            completion: nil
        )
    }

    func dismissModal() {
        rootNavigationController.dismiss(animated: true, completion: nil)
    }
}
