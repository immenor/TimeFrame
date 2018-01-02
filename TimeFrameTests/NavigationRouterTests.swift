import XCTest
import Nimble

@testable import TimeFrame

class NavigationRouterTests: XCTestCase {
    var router: NavigationRouter!
    var fakeDelegate: FakeAddTimeZoneDelegate!

    override func setUp() {
        super.setUp()
        fakeDelegate = FakeAddTimeZoneDelegate()
        router = NavigationRouter(navigationController: UINavigationController(), animated: false)
        configureUIWindowWithRootViewController()
        router.setupRootViewController()
    }

    func test_displaysRootNavigationController() {
        expect(self.router.rootNavigationController).toNot(beNil())
        expect(self.router.rootNavigationController.topViewController).to(beAnInstanceOf(SummaryViewController.self))
    }

    func test_presentsCreatePersonViewController() {
        router.showCreatePersonModal()
        let navCtrl = router.rootNavigationController.presentedViewController as! UINavigationController
        expect(navCtrl.topViewController).to(beAnInstanceOf(CreatePersonViewController.self))
    }

    func test_dismissesModal() {
        let blankViewCtrl = UIViewController()
        router.rootNavigationController.present(blankViewCtrl, animated: false) {}
        expect(self.router.rootNavigationController.presentedViewController).to(be(blankViewCtrl))

        router.dismissModal(from: router.rootNavigationController)
        RunLoop.advance(by: 1)
        expect(self.router.rootNavigationController.presentedViewController).to(beNil())
    }

    func test_showTimeZoneSelectionTable() {
        let navCtrl = UINavigationController()
        router.showTimeZoneSelectionTable(navCtrl: navCtrl, delegate: fakeDelegate)
        expect(navCtrl.topViewController).to(
            beAnInstanceOf(
                TimeZoneSelectionTableViewController.self
            )
        )
    }

    func test_popsNavigationController() {
        router.showTimeZoneSelectionTable(navCtrl: router.rootNavigationController, delegate: fakeDelegate)
        router.popViewController(with: router.rootNavigationController)
        expect(self.router.rootNavigationController.topViewController).to(beAKindOf(SummaryViewController.self))
    }

    func test_showsAddAvailabilityViewController() {
        router.showAddAvailability(navCtrl: router.rootNavigationController)
        let presented = router.rootNavigationController.presentedViewController as! UINavigationController
        expect(presented.topViewController).to(beAnInstanceOf(AddAvailabilityViewController.self))
    }

    private func configureUIWindowWithRootViewController() {
        let appDelegate = UIApplication.shared.delegate!
        let window: UIWindow = appDelegate.window!!
        window.rootViewController = router.rootNavigationController
        window.makeKeyAndVisible()
    }
}

extension RunLoop {
    static func advance(by timeInterval: TimeInterval = 0.01) {
        let stopDate = NSDate().addingTimeInterval(timeInterval)
        main.run(until: stopDate as Date)
    }
}
