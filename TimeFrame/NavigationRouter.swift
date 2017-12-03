import Foundation
import UIKit

protocol Router {
    var rootNavigationController: UINavigationController {get set}
    func setupRootViewController()
    func showCreatePersonModal()
    func dismissModal()
    func showTimeZoneSelectionTable(navCtrl: UINavigationController)
}

class NavigationRouter: NSObject, Router {
    var rootNavigationController: UINavigationController
    var rootViewController: SummaryViewController?
    var isAnimated: Bool

    init(navigationController: UINavigationController, animated: Bool) {
        rootNavigationController = navigationController
        isAnimated = animated
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
            animated: isAnimated,
            completion: nil
        )
    }

    func dismissModal() {
        rootNavigationController.dismiss(animated: true, completion: nil)
    }

    func showTimeZoneSelectionTable(navCtrl: UINavigationController) {
        let timeZoneSelectionTable = TimeZoneSelectionTableViewController(style: .plain)

        navCtrl.pushViewController(
            timeZoneSelectionTable,
            animated: isAnimated
        )
    }
}
