import XCTest
import Nimble

@testable import TimeFrame

class AppDelegateTests: XCTestCase {
    var appDelegate: AppDelegate!
    var router: FakeNavigationRouter!
    override func setUp() {
        super.setUp()
        self.router = FakeNavigationRouter()
        self.appDelegate = AppDelegate(router: router)
        _ = self.appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
    }
    
    func test_hasRootViewController() {
        expect(self.appDelegate.window!.rootViewController).to(beAnInstanceOf(UINavigationController.self))
        expect(self.router.rootNavigationController).to(be(self.appDelegate.window!.rootViewController))
    }
    
    func test_setsUpRootViewController() {
        expect(self.router.setupRootViewController_wasCalled).to(beTrue())
    }
}
