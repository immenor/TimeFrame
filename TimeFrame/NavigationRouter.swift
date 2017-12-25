import Foundation
import UIKit

protocol Router {
    var rootNavigationController: UINavigationController {get set}
    func setupRootViewController()
    func showCreatePersonModal()
    func dismissModal()
    func showTimeZoneSelectionTable(navCtrl: UINavigationController, delegate: AddTimeZoneDelegate)
    func popViewController(with navCtr: UINavigationController)
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
        let modal = CreatePersonViewController(
            router : self,
            cellFactory: DefaultTableViewCellFactory()
        )
        let navCtrl = UINavigationController(rootViewController: modal)

        rootNavigationController.present(
            navCtrl,
            animated: isAnimated,
            completion: nil
        )
    }

    func popViewController(with navCtr: UINavigationController) {
        navCtr.popViewController(animated: isAnimated)
    }

    func dismissModal() {
        rootNavigationController.dismiss(animated: true, completion: nil)
    }

    func showTimeZoneSelectionTable(navCtrl: UINavigationController, delegate: AddTimeZoneDelegate) {
        let timeZoneSelectionTable = TimeZoneSelectionTableViewController(
            router: self,
            addTimeZoneDelegate: delegate
        )

        navCtrl.pushViewController(
            timeZoneSelectionTable,
            animated: isAnimated
        )
    }
}
