import Foundation
import UIKit
@testable import TimeFrame

class FakeNavigationRouter: Router {
    var rootNavigationController: UINavigationController

    init() {
        rootNavigationController = UINavigationController()
    }

    var setupRootViewController_wasCalled = false
    func setupRootViewController() {
        setupRootViewController_wasCalled = true
    }

    var showCreatePersonModal_wasCalled = false
    func showCreatePersonModal() {
        showCreatePersonModal_wasCalled = true
    }

    var dismissModal_wasCalled = false
    func dismissModal() {
        dismissModal_wasCalled = true
    }

    var showTimezoneSelectionTable_arg: UINavigationController!
    func showTimeZoneSelectionTable(navCtrl: UINavigationController) {
        showTimezoneSelectionTable_arg = navCtrl
    }
}
