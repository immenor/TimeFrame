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
}
