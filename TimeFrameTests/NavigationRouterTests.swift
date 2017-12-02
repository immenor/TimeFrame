import XCTest
import Nimble

@testable import TimeFrame

class NavigationRouterTests: XCTestCase {
    var router: NavigationRouter!
    override func setUp() {
        super.setUp()
        router = NavigationRouter(navigationController: UINavigationController())
    }
    
    func test_displaysRootNavigationController() {
        router.setupRootViewController()
        expect(self.router.rootNavigationController).toNot(beNil())
        expect(self.router.rootNavigationController.topViewController).to(beAnInstanceOf(ViewController.self))
    }
}
