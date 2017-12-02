import Foundation
import UIKit

protocol Router {
    var rootNavigationController: UINavigationController {get set}
    func setupRootViewController()
}

class NavigationRouter: NSObject, Router {
    var rootNavigationController: UINavigationController
    var rootViewController: ViewController?
    
    init(navigationController: UINavigationController) {
        rootNavigationController = navigationController
    }
    
    func setupRootViewController() {
        rootViewController = ViewController()
        rootNavigationController.pushViewController(
            rootViewController!,
            animated: false
        )
    }
}
