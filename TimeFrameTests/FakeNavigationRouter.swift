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

    var showTimeZoneSelectionTable_arg: UINavigationController!
    var showTimeZoneSelectionTable_argTwo: AddTimeZoneDelegate!
    func showTimeZoneSelectionTable(navCtrl: UINavigationController, delegate: AddTimeZoneDelegate) {
        showTimeZoneSelectionTable_arg = navCtrl
        showTimeZoneSelectionTable_argTwo = delegate
    }

    var popViewController_arg: UINavigationController!
    func popViewController(with navCtr: UINavigationController) {
        popViewController_arg = navCtr
    }
}
